"use client";
import React, { useState, useEffect } from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Typography from "@mui/material/Typography";
import { TopBar } from "../TopBar";
import foodbuddy from "../assets/foodbuddy2.jpeg";
import recipe1 from "../assets/recipe1.webp";
import recipe2 from "../assets/recipe2.jpeg";
import recipe3 from "../assets/recipe3.jpeg";
import recipe4 from "../assets/recipe4.jpeg";
import recipe5 from "../assets/recipe5.jpeg";

interface Recipe {
  steps: String;
  description: String;
  id: String;
}

const RecipePage: React.FC = () => {
  const [expandedCard, setExpandedCard] = useState<number | null>(null);
  const [recommendations, setRecommendations] = useState<Recipe[]>([]);

  useEffect(() => {
    const apiUrl = "http://127.0.0.1:8000/api/recommend/";

    fetch(apiUrl)
      .then((response) => {
        if (!response.ok) {
          throw new Error(`Request failed with status: ${response.status}`);
        }
        return response.json();
      })
      .then((data) => {
        console.log(data); // Add this line to check the data
        const recommendedRecipes: Recipe[] = data.recommendations;
        setRecommendations(recommendedRecipes);
      })

      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  const handleCardClick = (index: number) => {
    setExpandedCard(expandedCard === index ? null : index);
  };

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        minHeight: "100vh",
        backgroundColor: "#f7e2de",
        backgroundImage: `url(${foodbuddy.src})`,
        backgroundSize: "cover",
      }}
    >
      <TopBar />
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          marginTop: "64px",
        }}
      >
        {recommendations.length > 0 ? (
          recommendations.map((recipe, index) => (
            <Card
              key={index}
              style={{
                width:
                  expandedCard === null
                    ? "300px"
                    : expandedCard === index
                    ? "500px"
                    : "0px",
                height:
                  expandedCard === null
                    ? "800px"
                    : expandedCard === index
                    ? "800px"
                    : "0px",
                margin:
                  expandedCard === null
                    ? "16px"
                    : expandedCard === index
                    ? "16px"
                    : "0px",
                cursor: "pointer",
                backgroundImage: `url(${
                  [
                    recipe1.src,
                    recipe2.src,
                    recipe3.src,
                    recipe4.src,
                    recipe5.src,
                  ][index]
                })`, // Set the card background image based on index
                backgroundSize: "cover",
              }}
              onClick={() => handleCardClick(index)}
            >
              <CardContent>
                <div
                  style={{
                    background: "black",
                    padding: "16px",
                    borderRadius: "5px",
                  }}
                >
                  <Typography variant="h6" color="white">
                    Recipe number: {recipe.id} {/* Display title here */}
                  </Typography>
                  {expandedCard === index && (
                    <Typography variant="body2" color="white">
                      <ul>{recipe.steps}</ul>
                    </Typography>
                  )}
                </div>
              </CardContent>
            </Card>
          ))
        ) : (
          <p>Loading recommendations...</p>
        )}
      </div>
    </div>
  );
};

export default RecipePage;
