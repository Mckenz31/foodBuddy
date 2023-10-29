"use client";
import React, { useState } from "react";
import Typography from "@mui/material/Typography";

type CardType = {
  title: string;
  expirationDate: Date;
  quantity: number;
};

type CardItemProps = {
  card: CardType;
};

const CardItem: React.FC<CardItemProps> = ({ card }) => {
  const [isHovered, setIsHovered] = useState(false);

  const cardStyle = {
    backgroundColor: isHovered ? "#ffbb00" : "white",
    padding: "10px",
    margin: "10px",
    transition: "background-color 0.3s", // Add a transition for smooth color change
    cursor: "pointer",
  };

  return (
    <div
      style={cardStyle}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      <Typography variant="h6" color="textPrimary">
        {card.title}
      </Typography>
      <Typography variant="body2" color="textSecondary">
        Expiration Date: {card.expirationDate.toLocaleDateString()}
      </Typography>
      <Typography variant="body2" color="textSecondary">
        Quantity: {card.quantity}
      </Typography>
    </div>
  );
};

export default CardItem;
