import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Generate a fully static export for Amplify S3 hosting.
  output: "export",
};

export default nextConfig;
