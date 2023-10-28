import React from "react";
import { TopBar } from "../TopBar";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Typography from "@mui/material/Typography";

type CardType = {
  title: string;
  expirationDate: Date;
  quantity: number;
};

const InventoryPage = () => {
  // Sample card data (replace with your actual data)
  const fruits = [
    {
      title: "Apples",
      expirationDate: new Date("2023-11-07"),
      quantity: 10,
    },
    {
      title: "Bananas",
      expirationDate: new Date("2023-11-14"),
      quantity: 8,
    },
    {
      title: "Mangos",
      expirationDate: new Date("2023-11-04"),
      quantity: 8,
    },
    // Add more fruit items as needed
  ];

  const vegetables = [
    {
      title: "Carrots",
      expirationDate: new Date("2023-11-05"),
      quantity: 12,
    },
    {
      title: "Broccoli",
      expirationDate: new Date("2023-11-10"),
      quantity: 7,
    },
    {
      title: "Celery",
      expirationDate: new Date("2023-11-23"),
      quantity: 3,
    },
    {
      title: "Eggplant",
      expirationDate: new Date("2023-03-13"),
      quantity: 14,
    },
    // Add more vegetable items as needed
  ];

  const snacks = [
    {
      title: "Chips",
      expirationDate: new Date("2023-11-20"),
      quantity: 5,
    },
    {
      title: "Cookies",
      expirationDate: new Date("2023-11-30"),
      quantity: 3,
    },
    // Add more snack items as needed
  ];

  fruits.sort((a, b) => a.expirationDate - b.expirationDate);
  vegetables.sort((a, b) => a.expirationDate - b.expirationDate);
  snacks.sort((a, b) => a.expirationDate - b.expirationDate);

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column", // Display sections vertically
        alignItems: "center",
        justifyContent: "center", // Center horizontally
        minHeight: "100vh",
        backgroundColor: "#f7e2de",
      }}
    >
      <TopBar />

      <div
        style={{
          display: "flex",
          maxWidth: "1200px", // Adjust the maximum width as needed
        }}
      >
        <section
          style={{
            backgroundColor: "#ffc0cb", // Fruits background color
            padding: "20px",
            flex: 1,
            marginRight: "20px",
          }}
        >
          <Typography variant="h5" color="textPrimary">
            Fruits
          </Typography>
          <ul>
            {fruits.map((card, index) => (
              <li key={index}>
                <CardItem card={card} />
              </li>
            ))}
          </ul>
        </section>
        <section
          style={{
            backgroundColor: "#90ee90", // Vegetables background color
            padding: "20px",
            flex: 1,
            marginRight: "20px",
          }}
        >
          <Typography variant="h5" color="textPrimary">
            Vegetables
          </Typography>
          <ul>
            {vegetables.map((card, index) => (
              <li key={index}>
                <CardItem card={card} />
              </li>
            ))}
          </ul>
        </section>
        <section
          style={{
            backgroundColor: "#87ceeb", // Snacks background color
            padding: "20px",
            flex: 1,
          }}
        >
          <Typography variant="h5" color="textPrimary">
            Snacks
          </Typography>
          <ul>
            {snacks.map((card, index) => (
              <li key={index}>
                <CardItem card={card} />
              </li>
            ))}
          </ul>
        </section>
      </div>
    </div>
  );
};
const CardItem = ({ card }: { card: CardType }) => (
  <Card style={{ marginBottom: "10px" }}>
    <CardContent>
      <Typography variant="h6">{card.title}</Typography>
      <Typography variant="body2" color="textSecondary">
        Quantity: {card.quantity}
      </Typography>
      <Typography variant="body2" color="textSecondary">
        Expiration Date: {card.expirationDate.toLocaleDateString()}
      </Typography>
    </CardContent>
  </Card>
);

export default InventoryPage;
