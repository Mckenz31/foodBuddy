"use client";
import React, { useState } from "react";
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

const RecipePage = () => {
  const cardsData = [
    {
      title: "Recipe 1",
      description: "Description for Card 1",
      instructions: [
        "Step 1: Prepare ingredients",
        "Step 2: Cook",
        "Step 3: Serve",
      ],
      image: recipe1, // Import the image and add it here
    },
    {
      title: "Recipe 2",
      description: "Description for Card 2",
      instructions: ["Step 1: Mix", "Step 2: Bake", "Step 3: Enjoy"],
      image: recipe2, // Import the image and add it here
    },
    {
      title: "Recipe 3",
      description: "Description for Card 3",
      instructions: ["Step 1: Mix", "Step 2: Bake", "Step 3: Enjoy"],
      image: recipe3, // Import the image and add it here
    },
    {
      title: "Recipe 4",
      description: "Description for Card 4",
      instructions: ["Step 1: Mix", "Step 2: Bake", "Step 3: Enjoy"],
      image: recipe4, // Import the image and add it here
    },
    {
      title: "Recipe 5",
      description: "Description for Card 5",
      instructions: ["Step 1: Mix", "Step 2: Bake", "Step 3: Enjoy"],
      image: recipe5, // Import the image and add it here
    },
    // Add more card objects as needed
  ];

  const [expandedCard, setExpandedCard] = useState<number | null>(null);

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
        {cardsData.map((card, index) => (
          <Card
            key={index}
            style={{
              width:
                expandedCard === null
                  ? "200px"
                  : expandedCard === index
                  ? "500px"
                  : "0px",
              height:
                expandedCard === null
                  ? "300px"
                  : expandedCard === index
                  ? "500px"
                  : "0px",
              margin:
                expandedCard === null
                  ? "16px"
                  : expandedCard === index
                  ? "16px"
                  : "0px",
              cursor: "pointer",
              backgroundImage: `url(${card.image.src})`,
              backgroundSize: "cover",
            }}
            onClick={() => handleCardClick(index)}
          >
            <CardContent>
              <Typography variant="h6">{card.title}</Typography>
              <Typography variant="body2" color="textSecondary">
                {expandedCard === index ? (
                  <ul>
                    {card.instructions.map((step, stepIndex) => (
                      <li key={stepIndex}>{step}</li>
                    ))}
                  </ul>
                ) : (
                  card.description
                )}
              </Typography>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default RecipePage;
