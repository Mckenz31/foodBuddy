import React from "react";
import { TopBar } from "./TopBar";
import { Typography } from "@mui/material";

const Page = () => {
  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        minHeight: "100vh",
        backgroundColor: "#f7e2de", // Set the background color here
      }}
    >
      <TopBar />
      <Typography
        variant="h3"
        color="textPrimary"
        style={{ marginTop: "80px" }}
      >
        Hello! This is Food Buddy!
      </Typography>
    </div>
  );
};

export default Page;
