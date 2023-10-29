import React from "react";
import CardItem from "./CardItem";
import Typography from "@mui/material/Typography";

type CardType = {
  title: string;
  expirationDate: Date;
  quantity: number;
};

type SectionProps = {
  title: string;
  items: CardType[];
};

const Section: React.FC<SectionProps> = ({ title, items }) => {
  const sectionStyle: React.CSSProperties = {
    backgroundColor: "rgba(0, 0, 0, 0.5)", // Set the background color with opacity
    flex: 1,
    marginRight: "10px",
    maxHeight: "800px", // Set the maximum height to show up to 5 cards
    overflowY: "auto", // Enable vertical scrolling if the content exceeds maxHeight
    borderRadius: "10px",
  };

  const titleStyle: React.CSSProperties = {
    position: "sticky",
    top: "0",
    zIndex: 1, // Place it above the scrolling content
    backgroundColor: "rgba(0, 0, 0, 1)", // Add a background color to make it readable
    padding: "20px",
  };

  return (
    <section style={sectionStyle}>
      <div style={titleStyle}>
        <Typography variant="h5" color="white">
          {title}
        </Typography>
      </div>
      <ul>
        {items.map((card, index) => (
          <li key={index}>
            <CardItem card={card} />
          </li>
        ))}
      </ul>
    </section>
  );
};

export default Section;
