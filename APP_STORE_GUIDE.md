# App Store Deployment Guide

Complete guide to release **Mobile Military Force** on Google Play Store, Samsung Galaxy Store, and Microsoft Store.

---

## Prerequisites

Before starting, you'll need:
- Developer accounts (free or paid)
- Icon assets (192x192, 512x512 PNG)
- Screenshots (1080x1920 for mobile, 2560x1440 for Microsoft)
- Privacy policy URL
- Developer information

---

## 🤖 Google Play Store (Android)

### Step 1: Create Google Play Developer Account
1. Go to https://play.google.com/console
2. Click "Create account"
3. Pay $25 one-time registration fee
4. Complete your developer profile

### Step 2: Create App Listing
1. Click "Create app"
2. Fill in app name: **Mobile Military Force**
3. Select "Apps" category
4. Choose default language (English)
5. Confirm ESRB rating (Teens - contains violence)

### Step 3: Build APK/AAB
```bash
# Install Cordova globally
npm install -g cordova

# Create Cordova project
cordova create military-app com.militaryforce.game "Mobile Military Force"
cd military-app
cordova platform add android

# Copy your HTML/CSS/JS files to www/
cp ../index.html www/
cp ../manifest.json www/

# Build release APK
cordova build android --release
```

### Step 4: Sign APK
```bash
# Generate keystore (one time)
keytool -genkey -v -keystore military-game.keystore \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias militaryforce

# Sign APK
jarsigner -verbose -sigalg SHA1withRSA \
  -digestalg SHA1 -keystore military-game.keystore \
  platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk \
  militaryforce

# Align APK
zipalign -v 4 platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk \
  platforms/android/app/build/outputs/apk/release/app-release.apk
```

### Step 5: Upload to Play Store
1. Go to Google Play Console
2. Navigate to "Releases" → "Production"
3. Create new release
4. Upload APK file
5. Fill in release notes
6. Add app description and screenshots
7. Set pricing (Free)
8. Complete content rating questionnaire
9. Submit for review (takes 2-4 hours)

**Google Play Store URL**: https://play.google.com/store/apps/details?id=com.militaryforce.game

---

## 🌟 Samsung Galaxy Store

### Step 1: Create Samsung Developer Account
1. Go to https://developer.samsung.com
2. Click "Register"
3. Complete profile with company info
4. Pay $5 registration fee (or free for individuals)

### Step 2: Build APK for Samsung
```bash
# Follow same steps as Google Play
cordova build android --release
# (Signing process same as above)
```

### Step 3: Upload to Galaxy Store
1. Login to https://seller.samsungapps.com
2. Click "Register application"
3. Fill app information:
   - **App Name**: Mobile Military Force
   - **Category**: Games → Action
   - **Content Rating**: 12+ (Violence)
4. Upload APK
5. Add screenshots (min. 1, max. 6)
6. Write description and release notes
7. Set pricing: Free
8. Submit for review (takes 1-3 days)

**Samsung Galaxy Store URL**: https://www.samsungapps.com/appquery/appDetail.as?appId=com.militaryforce.game

---

## 🪟 Microsoft Store (Windows)

### Step 1: Create Microsoft Partner Account
1. Go to https://partner.microsoft.com/dashboard
2. Click "Create a developer account"
3. Sign in with Microsoft account
4. Pay $19 registration fee
5. Complete business information

### Step 2: Build for Windows
```bash
# Add Windows platform
cordova platform add windows

# Build release
cordova build windows --release
```

### Step 3: Create App Package
1. Open Visual Studio 2022
2. Load the Windows app project
3. Right-click project → "Store" → "Create App Packages"
4. Sign in with Microsoft account
5. Select your app from Microsoft Store
6. Choose "Yes, use a certificate"
7. Generate package

### Step 4: Upload to Microsoft Store
1. Go to Partner Center Dashboard
2. Click "Create new app"
3. Reserve name: **Mobile Military Force**
4. Fill in app details:
   - **Category**: Games / Action
   - **Rating**: 12+ or Mature
5. Pricing: Free
6. Upload app package (.msixbundle)
7. Add description and screenshots
8. Set store listing details
9. Submit for certification (takes 24-48 hours)

**Microsoft Store URL**: https://www.microsoft.com/store/apps/9NBLGGH4NNS1

---

## 📱 iOS App Store (Optional)

### Step 1: Apple Developer Program
1. Go to https://developer.apple.com
2. Enroll in Apple Developer Program ($99/year)
3. Complete your developer profile

### Step 2: Build for iOS
```bash
# Add iOS platform
cordova platform add ios

# Build release
cordova build ios --release
```

### Step 3: Upload to App Store Connect
1. Go to https://appstoreconnect.apple.com
2. Click "My Apps"
3. Create new app:
   - **Name**: Mobile Military Force
   - **Bundle ID**: com.militaryforce.game
   - **SKU**: MILITARYFORCE001
4. Add app information
5. Upload screenshots
6. Set ratings
7. Upload IPA build using Xcode
8. Submit for review

---

## 📋 Required Assets Checklist

### App Icon
- [ ] 192x192 PNG (Google Play, Samsung)
- [ ] 512x512 PNG (Google Play, Samsung)
- [ ] 70x70 PNG (Windows)
- [ ] 150x150 PNG (Windows)
- [ ] 310x310 PNG (Windows)
- [ ] 1024x1024 PNG (iOS - if targeting)

### Screenshots
- [ ] Mobile: 1080x1920 PNG (at least 2)
- [ ] Tablet: 1440x2560 PNG (optional)
- [ ] Windows: 2560x1440 PNG (at least 1)

### Content
- [ ] App description (80-4000 characters)
- [ ] Release notes (50-500 characters)
- [ ] Privacy policy URL
- [ ] Support email
- [ ] Website URL

---

## 🔒 Privacy & Security

### Privacy Policy Required
```
Privacy Policy Template:
- Data collection practices
- How data is used
- User rights
- Contact information

Create at: https://www.privacypolicygenerator.info/
```

### Permissions Required (Android)
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

---

## 🚀 After Publishing

### Monitoring
- Check daily reviews and ratings
- Respond to user feedback
- Monitor crash reports
- Track download statistics

### Updates
To push updates:
1. Modify version in `config.xml`
2. Rebuild and test
3. Sign new APK/app package
4. Upload to respective store
5. Submit for review again

### Version Format
- **config.xml**: `<widget id="..." version="1.0.0">`
- **package.json**: `"version": "1.0.0"`

---

## 🎯 Monetization Options

Once published, you can enable:
- **In-app ads** (Google AdMob, Unity Ads)
- **In-app purchases** (cosmetics, power-ups)
- **Premium version** (paid app)
- **Subscription** (monthly battle pass)

---

## 📞 Support

For app store submission issues:
- **Google Play**: https://support.google.com/googleplay/android-developer
- **Samsung**: https://developer.samsung.com/support
- **Microsoft**: https://partner.microsoft.com/support

---

## Summary

| Store | Fee | Time to Review | Live URL |
|-------|-----|---|----------|
| Google Play | $25 | 2-4 hours | play.google.com/store/apps/details?id=com.militaryforce.game |
| Samsung Galaxy | $5 | 1-3 days | samsungapps.com |
| Microsoft Store | $19 | 24-48 hours | microsoft.com/store |
| iOS App Store | $99/yr | 1-3 days | apps.apple.com |

---

**Good luck with your app release! 🎮🚀**
