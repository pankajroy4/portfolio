const esbuild = require("esbuild");
const postcssPlugin = require("esbuild-plugin-postcss").default;

esbuild
  .context({
    entryPoints: ["app/javascript/application.js"], // Entry JS file
    bundle: true,
    sourcemap: true,
    format: "esm", // Output format
    outdir: "app/assets/builds", // Output directory
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
      "process.env.NODE_ENV": '"development"', // or "production"
      "process.env.PUBLIC_URL": '"/assets"',
    },
    minify: true,
    plugins: [postcssPlugin()],
  })
  .then((context) => {
    return context.watch().then(() => {
      console.log("Watching for file changes...");
    });
  })
  .catch((err) => {
    console.error("Build failed:", err);
    process.exit(1);
  });
