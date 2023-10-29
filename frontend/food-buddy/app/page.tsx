import React from "react";
import { TopBar } from "./TopBar";
import { Typography } from "@mui/material";
import foodbuddy from "./assets/foodbuddy2.jpeg";

const Page = () => {
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

        <Typography
          variant="h1"
          style={{
            fontFamily: "Bebas Neue, sans-serif",
          }}
        >
          This is Food Buddy!
        </Typography>
      </div>
      <link
        href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
        rel="stylesheet"
      />
    </div>
  );
};

export default Page;
