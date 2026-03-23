# datascience-capstone

# Machine Learning for Gunshot Residue Classification: Accuracy, Interpretability, and Failure Analysis

## Background

Gunshot residue (GSR) analysis is a critical component of forensic investigations involving firearm discharge. When a firearm is fired, microscopic particles containing elements such as lead (Pb), barium (Ba), and antimony (Sb) are released and can serve as key physical evidence in criminal cases. Traditional GSR identification relies on scanning electron microscopy with energy dispersive X-ray spectroscopy (SEM/EDS), where expert analysts classify particles based on morphology and elemental composition.

However, this process is prone to error. Chemically similar particles from environmental sources, such as brake dust, fireworks, and industrial materials, can produce false positives, while atypical GSR compositions may lead to false negatives. Since interpretation depends heavily on expert judgment, consistency and reproducibility across analyses remain concerns, particularly in high-stakes legal contexts.

Machine learning offers a data-driven alternative that can improve the consistency, scalability, and transparency of GSR classification. Unlike prior work that focuses primarily on model accuracy and efficiency, this project emphasizes interpretability and failure analysis. Understanding *why* models make decisions and *where* they fail is essential for responsible application in forensic science.

## Questions

1. **Primary:** How accurately and reliably can machine learning models distinguish true gunshot residue particles from chemically similar non-GSR particles?
2. **Comparative:** How does classification performance vary across different machine learning approaches (linear, tree-based, neural network) when applied to GSR identification?
3. **Interpretability:** Which elemental features and combinations contribute most strongly to model predictions, and how consistent are feature importance patterns across models?
4. **Failure Analysis:** Under what conditions do models misclassify particles, particularly false positives where environmental particles are incorrectly labeled as GSR, and what does this reveal about the limitations of automated classification?

## Hypotheses & Predictions

### Hypotheses

- Machine learning models can effectively distinguish true GSR particles from environmental confounders, with performance depending on algorithm choice and the underlying chemical characteristics of particles.
- Non-linear models (e.g., gradient-boosted trees, neural networks) will outperform linear models (e.g., logistic regression) due to complex interactions among elemental features.
- Particles lacking the classic Pb-Ba-Sb signature are more likely to be misclassified as false negatives, while chemically similar confounders such as brake dust will drive higher false positive rates.

### Predictions

- Non-linear models will outperform the logistic regression baseline across accuracy, precision, recall, F1 score, and ROC-AUC, though hyperparameter tuning will be necessary to reduce false positive rates for chemically ambiguous particles.
- Feature importance analyses (e.g., SHAP, permutation importance) will identify lead, barium, and antimony — and their ratios — as the most influential predictors, especially in borderline classifications.
- Misclassifications will concentrate among particles with elemental profiles that partially overlap with the Pb-Ba-Sb signature, highlighting edge cases that would benefit from additional expert review rather than fully automated classification.
