# Password protection for static pages

This simple HTML document helps you protecting static pages or whole websites with no server configuration required: you can now use Dropbox, Amazon S3 or any generic hosting service to host a private, password protected site.

This small project is a byproduct of my [Tumbless blogging platform](https://github.com/matteobrusa/Tumbless) project.

**Note**: This is a forked version which removes dependencies to external SHA library and jQuery. The only file that is required to copy is the `index.html`.

## Setup

0. Upload the `index.html` document to your static hosting service.
0. (Choose a different hash type. You can use SHA-1, SHA-256, SHA-384, SHA-512)
0. Use `generate_pw.sh` to generate the password
0. Create a folder with that name and add an index.html next to the `index.html` file
0. Upload the content that you want to protect inside the folder

The final structure will be:

```
- index.html
- this-is-a-hash      <-- the Base62 SHA-256 hash of your password               
  \ - index.html      <-- your original index document
```

Currently, in this repo the password `password` is used with SHA-256.

### Is this secure?
Pretty much secure, please consider that:

0. If your hosting service offers directory listing, a visitor can bypass the protection.
1. there's no protection against brute force attack. Pick a very long and hard to guess password. 
2. The password's hash is part of the URI. __Enforce HTTPS__ to avoid man in the middle attacks.

## Troubleshooting

0. Test the [demo page](http://matteobrusa.github.io/Password-protection-for-static-pages/) in your browser with password 'secret'
0. Deploy the whole repo on your hosting, and test again.
