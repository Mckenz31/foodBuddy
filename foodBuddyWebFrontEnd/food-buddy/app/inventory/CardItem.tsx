"use client";
import React, { useState } from "react";
import Typography from "@mui/material/Typography";

type CardType = {
  name: string;
  expiration_date: Date;
  quantity: number;
};

type CardItemProps = {
  card: CardType;
};

const CardItem: React.FC<CardItemProps> = ({ card }) => {
  const [isHovered, setIsHovered] = useState(false);

  const cardStyle = {
    backgroundColor: isHovered ? "#ffbb00" : "white",
    padding: "20px 60px 20px 40px",
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
        {card.name}
      </Typography>
      <Typography variant="body2" color="textSecondary">
        Expiration Date: {card.expiration_date.toString()}
      </Typography>
      <Typography variant="body2" color="textSecondary">
        Quantity: {card.quantity}
      </Typography>
    </div>
  );
};

export default CardItem;
