import React from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Typography from "@mui/material/Typography";
import { TopBar } from "../TopBar";

const RecipePage = () => {
  // Sample card data (replace with your actual data)
  const cards = [
    {
      title: "Recipe 1",
      description: "Description for Card 1",
    },
    {
      title: "Recipe 2",
      description: "Description for Card 2",
    },
    // Add more card objects as needed
    {
      title: "Recipe 3",
      description: "Description for Card 3",
    },
    {
      title: "Recipe 4",
      description: "Description for Card 4",
    },
  ];

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column", // Ensure cards are stacked vertically
        alignItems: "center", // Center horizontally
        minHeight: "100vh",
        backgroundColor: "#f7e2de",
      }}
    >
      <TopBar />
      <div style={{ marginTop: "64px" }}>
        {cards.map((card, index) => (
          <Card
            key={index}
            style={{
              minWidth: "400px",
              minHeight: "200px",
              marginBottom: "16px",
            }}
          >
            <CardContent>
              <Typography variant="h6">{card.title}</Typography>
              <Typography variant="body2" color="textSecondary">
                {card.description}
              </Typography>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default RecipePage;
