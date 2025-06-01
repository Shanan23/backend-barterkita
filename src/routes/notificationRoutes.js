const express = require('express');
const router = express.Router();
const notificationController = require('../controllers/notificationController');
const { authenticateUser } = require('../middleware/authMiddleware');

// Send notification to specific users
router.post('/send', authenticateUser, async (req, res) => {
  try {
    const { tokens, notification, data } = req.body;
    const response = await notificationController.sendNotification(tokens, notification, data);
    res.json(response);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Send notification to a topic
router.post('/topic', authenticateUser, async (req, res) => {
  try {
    const { topic, notification, data } = req.body;
    const response = await notificationController.sendTopicNotification(topic, notification, data);
    res.json(response);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Subscribe tokens to a topic
router.post('/subscribe', authenticateUser, async (req, res) => {
  try {
    const { tokens, topic } = req.body;
    const response = await notificationController.subscribeToTopic(tokens, topic);
    res.json(response);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Unsubscribe tokens from a topic
router.post('/unsubscribe', authenticateUser, async (req, res) => {
  try {
    const { tokens, topic } = req.body;
    const response = await notificationController.unsubscribeFromTopic(tokens, topic);
    res.json(response);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
