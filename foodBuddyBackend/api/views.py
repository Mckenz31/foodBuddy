# api/views.py
import datetime
from itertools import groupby
from random import sample
# from time import timezone
from django.utils import timezone


from rest_framework import generics, viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import CustomUser, Product, Recommendation
from .serializers import CustomUserSerializer, ProductSerializer, RecommendationSerializer
# from .data import hack


class UserList(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer


class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

    def list(self, request, *args, **kwargs):
        queryset = Product.objects.order_by('category')  # Ensure the queryset is ordered by the grouping field

        grouped_products = []
        for key, group in groupby(queryset, key=lambda x: x.category):
            group_list = list(group)
            grouped_products.append({
                'category': key,
                'products': ProductSerializer(group_list, many=True).data,
            })

        return Response(grouped_products)


class RecommendationViewSet(viewsets.ModelViewSet):
    queryset = Recommendation.objects.all()
    serializer_class = RecommendationSerializer


@api_view(['GET'])
def recommend_items(request):
    # Define the queryset to filter the items
    current_date = timezone.now()
    items_queryset = Product.objects.filter(
        expiration_date__gt=current_date,
        expiration_date__lte=current_date + timezone.timedelta(days=3),
        quantity__gt=0
    )
    # Convert the queryset to a list
    items_list = list(items_queryset)

    # Randomly shuffle the list (selecting all items in this example)
    shuffled_items = sample(items_list, len(items_list))

    # Sort the shuffled items by expiration_date
    sorted_items = sorted(shuffled_items, key=lambda item: item.expiration_date)

    # Extract only the 'name' field from the sorted items
    sorted_names = [item.name for item in sorted_items]

    # For this function to work you have to import the dataset and set the location
    # recommended_recipes = hack.get_rec(sorted_names)
    recommended_recipes = ["Recipe 1", "Recipe 2", "Recipe 3"]  # Replace with your logic

    return Response({'recommendations': recommended_recipes})
