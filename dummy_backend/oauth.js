const express = require('express');
const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const session = require('express-session');
const User = require('../models/User.js');
const { googleOAuth } = require('../config'); // OAuth credentials

const router = express.Router();

// Configure express-session middleware
router.use(session({
  secret: 'your_session_secret',
  resave: false,
  saveUninitialized: true
}));

// Initialize Passport.js middleware
router.use(passport.initialize());
router.use(passport.session());

// Serialize user into session
passport.serializeUser((user, done) => {
  done(null, user.id);
});

// Deserialize user from session
passport.deserializeUser(async (id, done) => {
  try {
    const user = await User.findByPk(id);
    done(null, user);
  } catch (error) {
    done(error, null);
  }
});

// Configure Google OAuth 2.0 Strategy
passport.use(new GoogleStrategy({
  clientID: googleOAuth.clientID,
  clientSecret: googleOAuth.clientSecret,
  callbackURL: googleOAuth.callbackURL
}, async (accessToken, refreshToken, profile, done) => {
  try {
    // Check if user already exists in the database
    let user = await User.findOne({ where: { googleId: profile.id } });

    if (!user) {
      // Create a new user if not exists
      user = await User.create({
        googleId: profile.id,
        username: profile.displayName // Adjust as per your User model
      });
    }

    return done(null, user);
  } catch (error) {
    return done(error, null);
  }
}));

// Route for initiating Google OAuth authentication
router.get('/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// Route for handling Google OAuth callback
router.get('/google/callback',
  passport.authenticate('google', { failureRedirect: '/login' }),
  (req, res) => {
    // Successful authentication, redirect home.
    res.redirect('/');
  });

module.exports = router;
