# NeuroFleetX ML Models

## 📝 Note on Model Files

The trained ML model files (`.pkl` files) are not included in the repository due to their large size (100MB+). You need to train them locally before running the ML service.

## 🚀 Quick Start - Train All Models

### Option 1: Train All Models at Once (Recommended)

```bash
cd neurofleetx-ml
python data/train_all_models.py
```

This will train all three models:
- ETA Prediction Model
- Vehicle Recommendation Model  
- Maintenance Prediction Model

### Option 2: Train Models Individually

```bash
cd neurofleetx-ml

# Train ETA model
python model/train_eta_model.py

# Train recommendation model
python model/train_recommendation_model.py

# Train maintenance model
python model/train_maintenance_model.py
```

## 📦 Expected Output Files

After training, you should have these files in `neurofleetx-ml/`:
- `eta_model_neurofleetx.pkl` (~1MB)
- `vehicle_recommendation_model.pkl` (~96MB)
- `maintenance_prediction_model.pkl` (~2.5MB)

## ⚙️ Requirements

Make sure you have installed all dependencies:

```bash
pip install -r requirements.txt
```

## 🔍 Training Data

The training data CSV files are included:
- `fleet_routes_neurofleetx.csv` - For ETA prediction
- `booking_history_neurofleetx.csv` - For vehicle recommendations
- `vehicle_health_neurofleetx.csv` - For maintenance predictions

## ⏱️ Training Time

- ETA Model: ~30 seconds
- Recommendation Model: ~2-3 minutes
- Maintenance Model: ~1 minute

Total: ~5 minutes for all models

## ✅ Verification

After training, start the ML service:

```bash
python app.py
```

You should see:
```
✅ ETA model loaded successfully!
✅ Recommendation model loaded successfully!
✅ Maintenance model loaded successfully!
```

## 🐛 Troubleshooting

### Error: "Model file not found"
**Solution:** Train the models using the commands above

### Error: "Module not found"
**Solution:** Install requirements: `pip install -r requirements.txt`

### Error: "Memory error during training"
**Solution:** The recommendation model is large. Ensure you have at least 4GB free RAM

## 📚 Model Details

### ETA Prediction Model
- Algorithm: XGBoost Regressor
- Features: Distance, traffic level, time of day, weather
- Accuracy: ~85% within 5-minute window

### Vehicle Recommendation Model
- Algorithm: Random Forest Classifier
- Features: Trip type, distance, passenger count, luggage, preferences
- Accuracy: ~92%

### Maintenance Prediction Model
- Algorithm: Gradient Boosting Classifier
- Features: Mileage, engine hours, last service, health readings
- Accuracy: ~88%

---

**Note:** These models are trained on synthetic data for demonstration purposes. For production use, retrain with real fleet data.
