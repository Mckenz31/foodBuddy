import os
import sys

import joblib
import pickle
import ast
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from math import sqrt
from sklearn.metrics.pairwise import pairwise_distances
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from IPython.core.interactiveshell import InteractiveShell
# from foodBuddyBackend.foodBuddyBackend.settings import BASE_DIR
InteractiveShell.ast_node_interactivity = "all"

# print(pd.__version__)
# User Input
# In[2]:




def get_rec (user_input):


    # user_input = ['beef', 'garlic', 'tomatoes', 'olive oil', 'basil','basketball']
    # # user_input = ['meat', 'garlic', 'tomatoes', 'olive oil', '60-minutes-or-less']


    # Load Files

    # In[3]:


    recipes = pd.read_csv('C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/RAW_recipes.csv')
    # print(recipes.shape)

    interactions = pd.read_csv('C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/RAW_interactions.csv')
    # print(interactions.shape)

    imap = joblib.load("C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/ingr_map.pkl")
    # print(imap.shape)


    # In[4]:


    pickle_recipes = pd.read_pickle('C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/pp_recipes.pkl')
    pickle_users = pd.read_pickle('C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/pp_users.pkl')


    # In[5]:


    # pp_recipes.sample(5)


    # In[6]:


    # pp_recipes.columns


    # In[7]:


    # #plot the ratings
    # interactions.rating.value_counts().plot(kind = 'bar')
    # plt.show()


    # In[8]:


    # Filter out ratings with a value of 0
    interactions = interactions[interactions['rating'] > 0]

    # Get the number of unique recipes that have at least one rating
    unique_recipe_count = interactions['recipe_id'].nunique()
    # print(unique_recipe_count)


    group = (interactions.groupby('recipe_id')
               .agg(rating_count=('rating', 'count'), rating_mean=('rating', 'mean'))
               .reset_index()
               .sort_values(by='rating_count', ascending=False))


    # In[9]:


    # Filter recipes with 40 or more comments
    filtered_grouped = group[group['rating_count'] >= 40]

    # Number of recipes with 40 or more comments
    num_recipes_with_40_or_more_comments = len(filtered_grouped)

    # Average rating range for these recipes
    min_avg_rating = filtered_grouped['rating_mean'].min()
    max_avg_rating = filtered_grouped['rating_mean'].max()

    # Value counts for average ratings
    avg_rating_counts = filtered_grouped['rating_mean'].value_counts()

    # IDs of recipes with 40 or more comments
    recipes_to_filter = filtered_grouped['recipe_id'].tolist()

    # Filter the recipe dataset with the selected recipes
    filtered_recipes = recipes[recipes['id'].isin(recipes_to_filter)]


    # In[10]:


    # del raw_recipes
    # del raw_interactions


    # In[11]:


    # Get the number of unique recipe IDs
    unique_recipe_ids = filtered_recipes['id'].nunique()

    # Get the number of unique recipe names
    unique_recipe_names = filtered_recipes['name'].nunique()

    # Get the count of recipes with the same name
    duplicate_names = filtered_recipes['name'].value_counts()

    # Identify recipes with duplicate names
    duplicated_name_recipes = filtered_recipes[filtered_recipes['name'].duplicated(keep=False)]

    # Remove recipes with duplicate names
    filtered_recipes = filtered_recipes[~filtered_recipes['name'].isin(duplicated_name_recipes['name'])]

    # Get the count of remaining recipes
    remaining_recipe_count = len(filtered_recipes)


    # In[12]:


    # print(remaining_recipe_count)


    # In[13]:


    # Clean and split the 'nutrition' column and assign it to new columns
    nutrition_columns = ['calories', 'total fat (PDV)', 'sugar (PDV)', 'sodium (PDV)', 'protein (PDV)', 'saturated fat (PDV)', 'carbohydrates (PDV)']
    filtered_recipes[nutrition_columns] = filtered_recipes['nutrition'].str.replace(r'[\[\]]', '').str.split(',', expand=True).astype('float')


    # Outlier Detection

    # In[14]:


    # Define the outlier functions
    def outlier_thresholds(dataframe, col_name, q1, q3):
        quartile1 = dataframe[col_name].quantile(q1)
        quartile3 = dataframe[col_name].quantile(q3)
        interquantile_range = quartile3 - quartile1
        up_limit = quartile3 + 1.5 * interquantile_range
        low_limit = quartile1 - 1.5 * interquantile_range
        return low_limit, up_limit

    def check_outlier(dataframe, col_name, q1, q3):
        low_limit, up_limit = outlier_thresholds(dataframe, col_name, q1, q3)
        return dataframe[(dataframe[col_name] > up_limit) | (dataframe[col_name] < low_limit)].any(axis=None)

    def replace_with_thresholds(dataframe, variable, q1, q3):
        low_limit, up_limit = outlier_thresholds(dataframe, variable, q1, q3)
        dataframe.loc[(dataframe[variable] > up_limit), variable] = up_limit


    # Select numeric columns for outlier analysis
    num_cols = ['minutes', 'n_steps', 'n_ingredients', 'calories', 'total fat (PDV)', 'sugar (PDV)', 'sodium (PDV)', 'protein (PDV)', 'saturated fat (PDV)', 'carbohydrates (PDV)']

    # Perform outlier analysis and replacement
    for col in num_cols:
        replace_with_thresholds(filtered_recipes, col, q1=0.2, q3=0.8)

    # Remove rows where 'minutes' column is 0
    filtered_recipes = filtered_recipes[filtered_recipes['minutes'] != 0]

    # Reset the index
    filtered_recipes.reset_index(drop=True, inplace=True)

    # Save the selected columns to a CSV file
    filtered_recipes[['id', 'name']].to_csv('final_recipes.csv', index=False)


    # In[15]:


    # filtered_recipes.describe()


    # In[ ]:





    # Tags
    #

    # In[16]:


    # # Extract distinct tags from the 'tags' column of the filtered_recipes DataFrame
    distinct_tags = list(set(filtered_recipes['tags'].explode().tolist()))

    # Create a DataFrame of tag frequencies
    tag_frequencies = filtered_recipes['tags'].explode().value_counts().reset_index()
    tag_frequencies.columns = ['tag', 'frequency']

    # Filter tags by frequency
    tag_frequencies = tag_frequencies[tag_frequencies['frequency'] >= 140]

    # Select the top 85 most frequent tags
    final_tags = tag_frequencies.head(85)

    # Save the final tags to a CSV file
    final_tags[['tag']].to_csv('final_tags.csv', index=False)


    # In[17]:


    # tag_lists = filtered_recipes.tags.tolist()
    # merged_list = []
    # for tag_list in tag_lists:
    #     merged_list.extend(tag_list)

    # distinct_tags = list(set(merged_list))
    # len(distinct_tags)


    # distinct_tags_df = pd.DataFrame({'tags': distinct_tags})
    # tag_frequencies = filtered_recipes['tags'].explode().value_counts().reset_index()
    # tag_frequencies = distinct_tags_df.merge(tag_frequencies, left_on='tags', right_on='index', how='left')
    # tag_frequencies.drop('index',axis=1,inplace=True)
    # tag_frequencies.columns = ['tag', 'frequency']

    # tag_frequencies = tag_frequencies.sort_values(by='frequency', ascending=False).reset_index(drop=True)
    # tag_frequencies


    # In[18]:


    # len(tag_frequencies)


    # In[19]:


    pp_recipes=pd.read_csv('C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/PP_recipes.csv')
    filtered_pp=pp_recipes[pp_recipes.id.isin(filtered_recipes.id)]
    import ast
    filtered_pp['ingredient_id_eval'] =filtered_pp.ingredient_ids.apply(ast.literal_eval)
    merged_ing_ids = set([value for sublist in filtered_pp.ingredient_id_eval for value in sublist])
    len(merged_ing_ids)
    ingr_map_filtered=imap[imap.id.isin(merged_ing_ids)]
    final_ingr_list=list(set(ingr_map_filtered.replaced))

    final_ingr_list=pd.DataFrame(final_ingr_list)
    final_ingr_list.columns=['INGREDIENT']
    final_ingr_list.to_csv('C:/Users/mohit/PycharmProjects/foodBuddy3/foodBuddyBackend/Items/data/final_ingredients.csv',index=False)


    # In[20]:


    # filtered_recipes.describe()


    # In[21]:


    # %matplotlib inline
    # fig, ax = plt.subplots()
    # filtered_recipes[num_cols].hist(ax=ax, bins=30)
    # fig.tight_layout()
    # plt.show();


    # Nutrition Filtering

    # In[22]:


    watch_calories = False
    i_dont_have_time = False


    # In[23]:


    # print('SEG1 - Less than 30 minutes & Low Calory :',len(filtered_recipes[(filtered_recipes.minutes<=30)&(filtered_recipes.calories<=450)]))
    # print('SEG2 - Less than 30 minutes & High Calory :',len(filtered_recipes[(filtered_recipes.minutes<=30)&(filtered_recipes.calories>450)]))
    # print('SEG3 - More than 30 minutes & Low Calory :',len(filtered_recipes[(filtered_recipes.minutes>30)&(filtered_recipes.calories<=450)]))
    # print('SEG4 - More than 30 minutes & High Calory :',len(filtered_recipes[(filtered_recipes.minutes>30)&(filtered_recipes.calories>450)]))


    # In[ ]:





    # Ingredient mapping
    #

    # In[24]:


    # filtered_recipes.head()


    # In[25]:


    ingredient_mapping = dict(zip(imap['raw_ingr'], imap['replaced']))
    import ast

    # Function to replace ingredient names in a list
    def replace_ingredients(ingredient_list):
        ingredients = ast.literal_eval(ingredient_list)
        return [ingredient_mapping.get(ingredient, ingredient) for ingredient in ingredients]

    # Apply the function to the 'ingredients' column in filtered_recipes data frame
    filtered_recipes['ingredients_mapped'] = filtered_recipes['ingredients'].apply(replace_ingredients)



    # In[26]:


    filtered_rows = filtered_recipes[filtered_recipes['ingredients'].apply(lambda x: 'extra virgin olive oil' in x)]
    # filtered_rows.head(1)


    # In[27]:


    filtered_recipes['tags'] = filtered_recipes['tags'].apply(lambda x: eval(x))

    filtered_recipes['merged_tags_ingredients'] = filtered_recipes.apply(lambda row: row['ingredients_mapped'] + row['tags'], axis=1)
    filtered_recipes['merged_tags_ingredients'] = filtered_recipes['merged_tags_ingredients'].apply(lambda lst: ', '.join(lst))


    # In[28]:


    # filtered_recipes.head(2)


    # In[29]:


    # filtered_recipes.columns


    # In[30]:


    filtered_recipes.to_csv('final_recipes_all.csv',index=False)


    # In[31]:


    if i_dont_have_time == True and watch_calories ==True:
        cont = filtered_recipes[(filtered_recipes.minutes<=30)&(filtered_recipes.calories<=450)]
    if i_dont_have_time == True and watch_calories == False:
        cont = filtered_recipes[(filtered_recipes.minutes<=30)&(filtered_recipes.calories>450)]
    if i_dont_have_time == False and watch_calories ==True:
        cont = filtered_recipes[(filtered_recipes.minutes>30)&(filtered_recipes.calories<=450)]
    if i_dont_have_time == False and watch_calories == False:
        cont = filtered_recipes[(filtered_recipes.minutes>30)&(filtered_recipes.calories>450)]


    cont.set_index('name', inplace=True)


    # TFidf and count vectorizer
    #

    # In[32]:


    from sklearn.feature_extraction.text import TfidfVectorizer

    def tf_idf_vectorizer(dataframe,corpus_col):
        vectorizer = TfidfVectorizer(stop_words="english")

        # Fit and transform the recipe corpus
        recipe_corpus = dataframe[corpus_col]
        tfidf_matrix = vectorizer.fit_transform(recipe_corpus)

        return vectorizer, tfidf_matrix


    # In[33]:


    def best_match(vectorizer,tfidf_matrix,user_input):
        # Transform the user input using the fitted vectorizer
        user_input_tfidf = vectorizer.transform(user_input)

        # Compute the cosine similarity between user input and recipe corpus
        cosine_sim = cosine_similarity(user_input_tfidf, tfidf_matrix)

        # Get the indices of top 5 similar recipes
        best_match = list(cosine_sim.argsort()[0][-5:])

        return  best_match


    # In[34]:


    def names(dataframe,top5):
        # Get the names of top 5 recommended recipes
        # recommended_recipes = list(dataframe.iloc[top5].index)
        recommended_recipes = dataframe.iloc[top5]
        return recommended_recipes


    # In[35]:


    # cont.columns


    # In[36]:


    cont_vectorizer, cont_tfidf_matrix = tf_idf_vectorizer(cont,'merged_tags_ingredients')

    best_match_indices=best_match(cont_vectorizer,cont_tfidf_matrix,user_input)
    df = names(cont,best_match_indices)
    columns_to_drop = ['contributor_id', 'submitted', 'tags', 'nutrition',
                       'n_steps', 'description', 'n_ingredients',
                       'ingredients_mapped', 'merged_tags_ingredients']
    df.drop(columns_to_drop, axis=1)
    return df






