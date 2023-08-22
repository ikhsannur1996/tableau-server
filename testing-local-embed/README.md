# Local Embedding and Testing of Tableau Server Visualization

This guide will walk you through the process of locally embedding and testing a Tableau Server visualization using local HTML code. This method allows you to view the visualization in a web browser while simulating the authentication process.

## Prerequisites

- Tableau Server installed and running.
- A Tableau visualization published on the Tableau Server that requires authentication.

## Steps

### 1. Get the Embed Code

1. Log in to your Tableau Server account.
2. Navigate to the visualization you want to embed.
3. Click on the "Share" button or option.
4. In the sharing options, select the "Embed" option.
5. Copy the generated embed code.

### 2. Create an HTML File

1. Create a new folder on your local machine to store your project files.
2. Inside the folder, create a new text file named `index.html`.

### 3. Edit the HTML File

1. Open the `index.html` file in a text editor.
2. Paste the copied embed code inside the HTML file.

```html
<!DOCTYPE html>
<html>
<head>
    <title>Embedded Tableau Visualization</title>
</head>
<body>
    <!-- Paste the copied embed code here -->
    <!-- Example: -->
    <!-- <iframe src="EMBED_CODE_HERE" width="800" height="600"></iframe> -->
</body>
</html>
```

3. Replace `EMBED_CODE_HERE` with the actual embed code you copied from Tableau Server.
4. Adjust the `width` and `height` attributes as needed to fit the visualization dimensions.

### 4. Simulate Authentication

1. In the `index.html` file, locate the embedded iframe code.
2. Add a query parameter to the iframe URL to simulate authentication. For example, you can add `:embed=y&:showShareOptions=true` to the URL.

```html
<iframe src="EMBED_CODE_HERE:embed=y&:showShareOptions=true" width="800" height="600"></iframe>
```

### 5. Open in Browser

1. Save the `index.html` file.
2. Open your preferred web browser.
3. Drag and drop the `index.html` file into the browser window.

The browser should display the embedded Tableau visualization, and you will be able to interact with it as if you were viewing it on the Tableau Server. Since you added the query parameters to simulate authentication, you might be prompted to log in before accessing the visualization.
