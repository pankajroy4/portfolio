const esbuild = require("esbuild");
const postcssPlugin = require("esbuild-plugin-postcss").default;

const isProduction = process.env.NODE_ENV === "production";

const config = {
  entryPoints: ["app/javascript/application.js"],
  bundle: true,
  sourcemap: !isProduction,
  format: "esm",
  outdir: "app/assets/builds",
  loader: {
    ".js": "jsx",
    ".jsx": "jsx",
    ".ttf": "file",
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
  minify: isProduction,
  plugins: [postcssPlugin()],
};

if (isProduction) {
  esbuild.build(config).catch((err) => {
    console.error("Build failed:", err);
    process.exit(1);
  });
} else {
  esbuild.context(config).then((context) => {
    context.watch();
    console.log("Watching for file changes...");
  });
}
