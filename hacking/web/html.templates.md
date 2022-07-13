# html template

## upload file

### http form POST
```html
<!DOCTYPE html>
<html>
<body>
<form action="http://target.local/upload.php" method="post" enctype="multipart/form-data">
  Select image to upload:
  <input type="file" name="myFile" id="myFile">
  <input type="submit" value="Upload Image" name="submit">
</form>
</body>
</html>
```
