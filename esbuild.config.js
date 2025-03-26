const esbuild = require("esbuild");
const postcssPlugin = require("esbuild-plugin-postcss").default;

const isProduction = process.env.NODE_ENV === "production";
esbuild
  .context({
    entryPoints: ["app/javascript/application.js"],
    bundle: true,
    sourcemap: !isProduction,  // No sourcemaps in production
    format: "esm",
    outdir: "app/assets/builds",
    loader: {
      ".js": "jsx", // Handle JS as JSX
      ".jsx": "jsx", // Handle JSX as JSX
      ".ttf": "file", // Handle fonts
      ".woff": "file",
      ".css": "css",
      ".woff2": "file",
      ".eot": "file",
      ".svg": "file",
      ".png": "file",
      ".gif": "file",
      ".jpg": "file",
    },
    define: {
      "process.env.NODE_ENV": JSON.stringify(isProduction ? "production" : "development"),
      "process.env.PUBLIC_URL": '"/assets"',
    },
    minify: isProduction, // Minify only in production
    plugins: [postcssPlugin()],
  })
  .then((context) => {
    if (!isProduction) {
      return context.watch().then(() => {
        console.log("Watching for file changes...");
      });
    }
  })
  .catch((err) => {
    console.error("Build failed:", err);
    process.exit(1);
  });
