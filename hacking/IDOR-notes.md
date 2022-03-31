# IDOR general steps
Find parameters that look like IDs. Change them to be different IDs to see if you can access things you shouldn't.
Try it authenticated as well. Logic bugs could lead to unchecked access in some specific endpoints, even if a lot of them are secured.
