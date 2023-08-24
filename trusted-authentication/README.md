# Test Trusted Authentication on Tableau Server

This document provides step-by-step instructions for testing trusted authentication on a Tableau Server. Trusted authentication allows secure communication between a web server and Tableau Server without requiring users to enter credentials.

**Note:** Trusted authentication should be used carefully and only in trusted environments, as misconfigurations can lead to security vulnerabilities.

## Prerequisites

- Access to the Tableau Server environment.
- A test user with appropriate permissions for testing.

## Step 1: Add a Test User

1. Create a user on the Tableau Server for testing purposes.
2. Add the test user to a site on the server.
3. Set the user's site role to "Explorer" or the desired role.

## Step 2: Create a Test HTML Page

1. Create a new `.html` file on the Tableau Server machine.
2. Paste the following HTML and JavaScript code into the file:

```html
<html>
<head>
<title>Trusted Ticket Requester</title>
<script type="text/javascript">
  function submitForm(){
    document.getElementById('form1').action =
    document.getElementById('server').value + "/trusted";
  }
</script>
<style type="text/css">
  .style1 {width: 100%;}
  .style2 {width: 429px;}
  #server {width: 254px;}
</style>
</head>
<body>
<h3>Trusted Ticketer</h3>
<form method="POST" id="form1" onSubmit="submitForm()">
  <table class="style1">
    <tr>
      <td class="style2">Username</td>
      <td><input type="text" name="username" value="" /></td>
    </tr>
    <tr>
      <td class="style2">Server</td>
      <td><input type="text" id="server" name="server" value="https://" /></td>
    </tr>
    <tr>
      <td class="style2">Client IP (optional)</td>
      <td><input type="text" id="client_ip" name="client_ip" value="" /></td>
    </tr>
    <tr>
      <td class="style2">Site (leave blank for Default site; otherwise enter the site name)</td>
      <td><input type="text" id="target_site" name="target_site" value="" /></td>
    </tr>
    <tr>
      <td class="style2"><input type="submit" name="submittable" value="Get Ticket" /></td>
      <td>&#160;</td>
    </tr>
  </table>
</form>
<h4>Be sure to add your IP as a Trusted IP address to the server</h4>
</body>
</html>
```

3. Customize the labels and style attributes as needed.

## Step 3: Retrieve a Trusted Ticket from Tableau Server

1. Open the created HTML page in a web browser.
2. Allow JavaScript to run if prompted.
3. Fill in the required information:
   - Username: The test user created in Step 1.
   - Server: The address of your Tableau Server (e.g., `https://<server_name>`).
   - Client IP (optional): IP address of the user's computer for client trusted IP matching.
   - Site: Name of the Tableau Server site that the test user belongs to.
4. Click "Get Ticket."
5. The result will be:
   - A unique ticket (base64-encoded UUID and random string) if successful.
   - -1 if there's a configuration error.

## Step 4: Test Access with Trusted Ticket

1. Use the generated unique ticket to construct a URL for accessing Tableau content.
2. If using the default site:
   ```
   https://<server_name>/trusted/<unique_ticket>/views/<workbook_name>/<view_name>
   ```
3. If using a non-default site:
   ```
   https://<server_name>/trusted/<unique_ticket>/t/<site_name>/views/<workbook_name>/<view_name>
   ```
   Replace placeholders with actual values.

## Additional Resources

- [Trusted Authentication Testing Guide](https://help.tableau.com/current/server/en-us/trusted_auth_testing.htm)
- [Trusted Authentication Documentation](https://help.tableau.com/current/server/en-us/trusted_auth.htm)
- [Trusted Authentication Web Requests](https://help.tableau.com/current/server/en-us/trusted_auth_webrequ.htm)

**Important:** Trusted authentication should be used with caution and configured securely to prevent unauthorized access.

---
