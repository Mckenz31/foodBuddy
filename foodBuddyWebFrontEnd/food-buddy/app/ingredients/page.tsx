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
  
}`;

const labelStyle = { display: "block", marginBottom: "5px" };
const inputStyle = {
  width: "100%",
  padding: "8px",
  border: "1px solid #ccc",
  borderRadius: "4px",
  color: "#9ca3af", // Change this color to your desired placeholder color
};

const IngredientPage = () => {
  const [formData, setFormData] = useState({
    title: "",
    expirationDate: "",
    quantity: "",
    foodType: "Fruits", // Default to "fruit"
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
    }, 3000); // 3000 milliseconds (3 seconds)
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

    // Create a new ingredient object
    const newIngredient = {
      name: formData.title,
      expiration_date: formData.expirationDate,
      quantity: parseInt(formData.quantity, 10),
      category: formData.foodType,
    };

    // Send a POST request to the API
    fetch("http://127.0.0.1:8000/api/products/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newIngredient),
    })
      .then((response) => {
        if (response.status === 201) {
          // Successful POST, clear the form
          setFormData({
            title: "",
            expirationDate: "",
            quantity: "",
            foodType: "Fruits",
          });
        } else {
          setError("Failed to submit the data. Please try again.");
          clearError();
        }
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        setError("An error occurred while submitting. Please try again.");
        clearError();
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
            <option value="Fruits">Fruit</option>
            <option value="Vegetable">Vegetable</option>
            <option value="Snack">Snack</option>
            <option value="Meat">Meat</option>
            <option value="Dairy">Dairy</option>
            <option value="Grains">Grains</option>
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
