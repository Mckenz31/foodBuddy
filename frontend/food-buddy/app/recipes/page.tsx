"use client";
import React, { useState } from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Typography from "@mui/material/Typography";
import { TopBar } from "../TopBar";
import foodbuddy from "../assets/foodbuddy2.jpeg";

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
    },
    {
      title: "Recipe 2",
      description: "Description for Card 2",
      instructions: ["Step 1: Mix", "Step 2: Bake", "Step 3: Enjoy"],
    },
    // Add more card objects as needed
  ];

  const [expandedCard, setExpandedCard] = useState(null);

  const handleCardClick = (index) => {
    setExpandedCard(expandedCard === index ? null : index);
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        minHeight: "100vh",
        backgroundColor: "#f7e2de",
        backgroundImage: `url(${foodbuddy.src})`,
        backgroundSize: "cover",
      }}
    >
      <TopBar />
      <div style={{ marginTop: "64px" }}>
        {cardsData.map((card, index) => (
          <Card
            key={index}
            style={{
              minWidth: "400px",
              minHeight: expandedCard === index ? "500px" : "200px",
              marginBottom: "16px",
              cursor: "pointer",
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
