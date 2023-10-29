"use client";
import React from "react";
import { TopBar } from "../TopBar";
import Section from "./Section";
import CardItem from "./CardItem";
import foodbuddy from "../assets/foodbuddy2.jpeg";

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

  const meat = [
    {
      title: "Chicken Breast",
      expirationDate: new Date("2023-11-02"),
      quantity: 2,
    },
    {
      title: "Ground Beef",
      expirationDate: new Date("2023-11-12"),
      quantity: 3,
    },
    // Add more meat items as needed
  ];

  const dairy = [
    {
      title: "Milk",
      expirationDate: new Date("2023-11-15"),
      quantity: 4,
    },
    {
      title: "Cheese",
      expirationDate: new Date("2023-11-25"),
      quantity: 6,
    },
    // Add more dairy items as needed
  ];

  const grains = [
    {
      title: "Rice",
      expirationDate: new Date("2023-12-05"),
      quantity: 10,
    },
    {
      title: "Bread",
      expirationDate: new Date("2023-11-18"),
      quantity: 2,
    },
    // Add more grain items as needed
  ];

  fruits.sort((a, b) => a.expirationDate - b.expirationDate);
  vegetables.sort((a, b) => a.expirationDate - b.expirationDate);
  snacks.sort((a, b) => a.expirationDate - b.expirationDate);
  meat.sort((a, b) => a.expirationDate - b.expirationDate);
  dairy.sort((a, b) => a.expirationDate - b.expirationDate);
  grains.sort((a, b) => a.expirationDate - b.expirationDate);

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column", // Ensure sections stack vertically
        alignItems: "center", // Center horizontally
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
          flexWrap: "wrap", // Allow sections to wrap to the next row
          justifyContent: "center", // Center sections horizontally
          gap: "10px", // Add 10px gap between sections
        }}
      >
        <Section title="Fruits" items={fruits} />
        <Section title="Vegetables" items={vegetables} />
        <Section title="Snacks" items={snacks} />
        <Section title="Meat" items={meat} />
        <Section title="Dairy" items={dairy} />
        <Section title="Grains" items={grains} />
      </div>
    </div>
  );
};

export default InventoryPage;
