"use client";
import React, { useState, ChangeEvent, FormEvent } from "react";
import { TopBar } from "../TopBar";
import { styled } from "@mui/system";
import { Typography, Button, Alert } from "@mui/material";
import foodbuddy from "../assets/foodbuddy2.jpeg";

const StyledButton = styled(Button)`
  &:hover {
    background-color: #ffbb00; // Change this to your desired hover color
  }
`;

const labelStyle = { display: "block", marginBottom: "5px" };
const inputStyle = {
  width: "100%",
  padding: "8px",
  border: "1px solid #ccc",
  borderRadius: "4px",
  color: "#9ca3af", // Change this color to your desired placeholder color
};

const IngredientPage = () => {
  const cards = [
    {
      title: "Apples",
      expirationDate: new Date("2023-11-07"),
      quantity: 10,
    },
    {
      title: "Chicken",
      expirationDate: new Date("2023-11-14"),
      quantity: 5,
    },
    {
      title: "Milk",
      expirationDate: new Date("2023-11-02"),
      quantity: 2,
    },
    {
      title: "Cheese",
      expirationDate: new Date("2023-11-12"),
      quantity: 3,
    },
  ];

  const [formData, setFormData] = useState({
    title: "",
    expirationDate: "",
    quantity: "",
    foodType: "fruit", // Default to "fruit"
  });

  const handleFormChange = (
    e: ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const [error, setError] = useState("");

  const clearError = () => {
    setTimeout(() => {
      setError("");
    }, 100000); // 3000 milliseconds (3 seconds)
  };

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (
      !formData.title ||
      !formData.expirationDate ||
      !formData.quantity ||
      !formData.foodType
    ) {
      setError("Please fill in all fields before submitting.");
      clearError();
      return;
    }
    setError("");

    const newIngredient = {
      title: formData.title,
      expirationDate: new Date(formData.expirationDate),
      quantity: parseInt(formData.quantity, 10),
      foodType: formData.foodType,
    };

    // Clear the form after submission
    setFormData({
      title: "",
      expirationDate: "",
      quantity: "",
      foodType: "fruit",
    });
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
      <form>
        <div style={{ marginBottom: "10px" }}>
          <label htmlFor="title" style={labelStyle}>
            <Typography color="white">Food Item:</Typography>
          </label>
          <input
            type="text"
            id="title"
            name="title"
            placeholder="Enter food item"
            value={formData.title}
            onChange={handleFormChange}
            style={inputStyle}
          />
        </div>
        <div style={{ marginBottom: "10px" }}>
          <label htmlFor="expirationDate" style={labelStyle}>
            <Typography color="white">Expiration Date:</Typography>
          </label>
          <input
            type="date"
            id="expirationDate"
            name="expirationDate"
            value={formData.expirationDate}
            onChange={handleFormChange}
            style={inputStyle}
          />
        </div>
        <div style={{ marginBottom: "10px" }}>
          <label htmlFor="quantity" style={labelStyle}>
            <Typography color="white">Quantity:</Typography>
          </label>
          <input
            type="number"
            id="quantity"
            name="quantity"
            placeholder="Enter quantity"
            value={formData.quantity}
            onChange={handleFormChange}
            style={inputStyle}
          />
        </div>
        <div style={{ marginBottom: "10px" }}>
          <label htmlFor="foodType" style={labelStyle}>
            <Typography color="white">Food Type:</Typography>
          </label>
          <select
            id="foodType"
            name="foodType"
            value={formData.foodType}
            onChange={handleFormChange}
            style={inputStyle}
          >
            <option value="fruit">Fruit</option>
            <option value="vegetable">Vegetable</option>
            <option value="snack">Snack</option>
            <option value="meat">Meat</option>
            <option value="dairy">Dairy</option>
            <option value="grains">Grains</option>
          </select>
        </div>
        <StyledButton onClick={handleSubmit} style={{ width: "100%" }}>
          <Typography color="white">Submit</Typography>
        </StyledButton>
      </form>

      {error && (
        <Alert
          severity="error"
          style={{
            position: "absolute",
            top: 100,
          }}
        >
          {error}
        </Alert>
      )}
    </div>
  );
};

export default IngredientPage;
