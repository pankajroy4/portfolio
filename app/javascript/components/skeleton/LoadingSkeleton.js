import React from "react";
import Skeleton from "@mui/material/Skeleton";
import Box from "@mui/material/Box";

const LoadSkeleton = ({ fullWidth = false }) => (
  <Box
    display="flex"
    alignItems="center"
    gap={2}
    padding={2}
    width={fullWidth ? "100%" : "auto"}
  >
    <Skeleton variant="rectangular" width="40%" height={200} />
    <Box flex={1}>
      <Skeleton variant="text" width="80%" height={30} />
      <Skeleton variant="text" width="90%" height={20} />
      <Skeleton variant="text" width="100%" height={20} />
    </Box>
  </Box>
);

export const LoadingSkeleton = () => (
  <div style={{ width: "100%", height: "100%" }}>
    <LoadSkeleton fullWidth />
  </div>
);

const PullReqSkeleton = ({ fullWidth = false }) => (
  <Box sx={{ width: "100%", textAlign: "center", mt: 4 }}>
    {[1, 2, 3].map((_, index) => (
      <Box
        key={index}
        sx={{
          borderRadius: "10px",
          p: 2,
          my: 2,
          mx: "auto",
          maxWidth: "78%",
          boxShadow: 0.1,
        }}
      >
        <Skeleton variant="text" width="100%" height={20} sx={{ mx: "0" }} />
        <Box sx={{ display: "flex", flexDirection: "column", gap: 1, mt: 1 }}>
          <Skeleton variant="rectangular" width="100%" height={12} />
          <Skeleton variant="rectangular" width="100%" height={12} />
          <Skeleton variant="rectangular" width="60%" height={12} />
        </Box>
      </Box>
    ))}
  </Box>
);

export const PullReqLoading = () => (
  <div style={{ width: "100%", height: "100%" }}>
    <PullReqSkeleton fullWidth />
  </div>
);
