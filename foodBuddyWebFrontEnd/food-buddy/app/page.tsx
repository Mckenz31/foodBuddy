"use client";
import React, { useEffect } from "react";
import { TopBar } from "./TopBar";
import { Typography } from "@mui/material";
import foodbuddy from "./assets/foodbuddy2.jpeg";

const Page = () => {
  useEffect(() => {
    document.title = "Food Buddy";
  }, []);
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
      <div style={{}}>
        <TopBar />

        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
            minHeight: "100vh",
          }}
        >
          <Typography
            variant="h1"
            style={{
              fontFamily: "Bebas Neue, sans-serif",
            }}
          >
            This is Food Buddy!
          </Typography>
          <Typography
            variant="h4"
            style={{
              color: "#ffbb00",
              fontFamily: "Bebas Neue, sans-serif",
            }}
          >
            Where flavor meets friendship!
          </Typography>
        </div>
      </div>
      <link
        href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
        rel="stylesheet"
      />
    </div>
  );
};

export default Page;
