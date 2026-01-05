# Keychain Generator For Spotify

A comprehensive toolset to create custom, 3D-printable keychains compatible with Spotify links. This project features a browser-based scanner to extract code data, designed to pair perfectly with the **Parametric Model Maker on MakerWorld**.

## 🚀 Features

* **Universal Compatibility:** Works with everything on Spotify including **Songs, Albums, Playlists, Artists, and User Profiles**.
* **Browser-Based Scanner:** Runs entirely in your browser to fetch code data from links without needing an API key.
* **MakerWorld Compatible:** Designed specifically for the MakerWorld "Parametric Model Maker" for instant, software-free customization.

## 🛠️ How to Use

### Step 1: Get the Code Data
1.  Go to the [Live Scanner Tool](https://hitansh16.github.io/KeychainGeneratorForSpotify/).
2.  Paste a Song, Album, or Playlist link from Spotify.
3.  Click **Scan Tag**.
4.  Copy the generated **CSV Data String**.

### Step 2: Generate the Model
1.  Go to the [MakerWorld Project Page](https://makerworld.com/en/@1GN16).
2.  Click the **"Customize"** button to open the Parametric Model Maker.
3.  Paste your CSV string into the **"Code Data"** field.
4.  (Optional) Adjust the length or hole size.
5.  Click **Download** or **Print** directly from MakerWorld.

### Step 3: Print Settings
* **Layer Height:** 0.2mm recommended.
* **Coloring the Code:**
    * **⚠️ High Contrast Required:** Ensure a strong contrast between the base and the bars (e.g., Black & White). Low contrast color combinations may not scan.
    * **Option A: Manual Color Swap (Standard Printers)**
      Add a pause at height **3.2mm** (layer 16 at 0.2mm height). Start printing with a dark color for the base, then swap to a light color for the code bars.
    * **Option B: Multi-Material System (AMS / MMU)**
      Import the STL into your slicer and use the **"Paint"** tool (Bucket Fill or Height Range) to color the raised bars a different color than the base.

## ⚖️ Legal Disclaimer

This project is an independent tool created for educational purposes. It is not affiliated, associated, authorized, endorsed by, or in any way officially connected with Spotify AB or any of its subsidiaries. The name Spotify, as well as related names, marks, emblems, and images are registered trademarks of their respective owners.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
