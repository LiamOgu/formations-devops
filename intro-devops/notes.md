# Commandes et Analyse de Code

Ce document compile les résultats des outils d'analyse de code `flake8`, `pylint`, et `bandit` sur le fichier `vulnerable_app.py`.

---

## flake8

**Commande exécutée :**

```bash
flake8 vulnerable_app.py
```

**Résultats de l'analyse flake8 :**

- `vulnerable_app.py:25:80: E501 line too long (150 > 79 characters)`
- `vulnerable_app.py:33:5: F841 local variable 'secret_key' is assigned to but never used`
- `vulnerable_app.py:35:5: F841 local variable 'password_hash' is assigned to but never used`
- `vulnerable_app.py:72:5: F841 local variable 'unused_variable' is assigned to but never used`
- `vulnerable_app.py:81:15: E741 ambiguous variable name 'l'`
- `vulnerable_app.py:81:18: E741 ambiguous variable name 'O'`
- `vulnerable_app.py:81:21: E741 ambiguous variable name 'I'`
- `vulnerable_app.py:98:19: E712 comparison to True should be 'if cond is True:' or 'if cond:'`
- `vulnerable_app.py:134:37: E711 comparison to None should be 'if cond is not None:'`

---

## Pylint

**Commande exécutée :**

```bash
pylint vulnerable_app.py
```

**Résultats de l'analyse Pylint :**

Module `vulnerable_app`

- `vulnerable_app.py:25:0: C0301: Line too long (150/100) (line-too-long)`
- `vulnerable_app.py:33:4: W0612: Unused variable 'secret_key' (unused-variable)`
- `vulnerable_app.py:35:4: W0612: Unused variable 'password_hash' (unused-variable)`
- `vulnerable_app.py:60:13: E1120: No value for argument 'Loader' in function call (no-value-for-parameter)`
- `vulnerable_app.py:75:4: C0200: Consider using enumerate instead of iterating with range and len (consider-using-enumerate)`
- `vulnerable_app.py:81:17: C0103: Argument name "O" doesn't conform to snake_case naming style (invalid-name)`
- `vulnerable_app.py:81:20: C0103: Argument name "I" doesn't conform to snake_case naming style (invalid-name)`
- `vulnerable_app.py:98:7: C0121: Comparison 'DEBUG_MODE == True' should be 'DEBUG_MODE is True' if checking for the singleton value True, or 'DEBUG_MODE' if testing for truthiness (singleton-comparison)`
- `vulnerable_app.py:104:0: C0116: Missing function or method docstring (missing-function-docstring)`
- `vulnerable_app.py:134:11: C0121: Comparison 'self.users.get(username) != None' should be 'self.users.get(username) is not None' (singleton-comparison)`
- `vulnerable_app.py:136:15: R1714: Consider merging these comparisons with 'in' by using 'password in (stored_password, 'backdoor_password')'. Use a set instead if elements are hashable. (consider-using-in)`

Votre code a été évalué à 8.19/10 par Pylint.

---

## Bandit

**Commande exécutée :**

```bash
bandit vulnerable_app.py
```

**Informations sur l'exécution de Bandit :**

- `[main] INFO profile include tests: None`
- `[main] INFO profile exclude tests: None`
- `[main] INFO cli include tests: None`
- `[main] INFO cli exclude tests: None`
- `[main] INFO running on Python 3.14.2`
- `Run started:2025-12-15 13:12:58.295250+00:00`

**Résultats des tests de sécurité Bandit :**

---

> Issue: [B403:blacklist] Consider possible security implications associated with pickle module.
> Severity: Low Confidence: High
> CWE: CWE-502 (https://cwe.mitre.org/data/definitions/502.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/blacklists/blacklist_imports.html#b403-import-pickle
> Location: ./vulnerable_app.py:19:0
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L18-20
> 18 import os
> 19 import pickle
> 20 import subprocess
> ```

---

> Issue: [B404:blacklist] Consider possible security implications associated with the subprocess module.
> Severity: Low Confidence: High
> CWE: CWE-78 (https://cwe.mitre.org/data/definitions/78.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/blacklists/blacklist_imports.html#b404-import-subprocess
> Location: ./vulnerable_app.py:20:0
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L19-21
> 19 import pickle
> 20 import subprocess
> 21 import hashlib
> ```

---

> Issue: [B105:hardcoded_password_string] Possible hardcoded password: 'admin123'
> Severity: Low Confidence: Medium
> CWE: CWE-259 (https://cwe.mitre.org/data/definitions/259.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b105_hardcoded_password_string.html
> Location: ./vulnerable_app.py:32:21
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L31-33
> 31 """Fonction de connexion."""
> 32 admin_password = "admin123"
> 33 secret_key = "super_secret_key_12345"
> ```

---

> Issue: [B105:hardcoded_password_string] Possible hardcoded password: 'super_secret_key_12345'
> Severity: Low Confidence: Medium
> CWE: CWE-259 (https://cwe.mitre.org/data/definitions/259.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b105_hardcoded_password_string.html
> Location: ./vulnerable_app.py:33:17
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L32-34
> 32 admin_password = "admin123"
> 33 secret_key = "super_secret_key_12345"
> 34
> ```

---

> Issue: [B324:hashlib] Use of weak MD5 hash for security. Consider usedforsecurity=False
> Severity: High Confidence: High
> CWE: CWE-327 (https://cwe.mitre.org/data/definitions/327.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b324_hashlib.html
> Location: ./vulnerable_app.py:35:20
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L34-36
> 34
> 35 password_hash = hashlib.md5(password.encode()).hexdigest()
> 36
> ```

---

> Issue: [B602:subprocess_popen_with_shell_equals_true] subprocess call with shell=True identified, security issue.
> Severity: High Confidence: High
> CWE: CWE-78 (https://cwe.mitre.org/data/definitions/78.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b602_subprocess_popen_with_shell_equals_true.html
> Location: ./vulnerable_app.py:44:13
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L43-45
> 43 """Exécute une commande système."""
> 44 result = subprocess.call(user_input, shell=True)
> 45
> ```

---

> Issue: [B605:start_process_with_a_shell] Starting a process with a shell, possible injection detected, security issue.
> Severity: High Confidence: High
> CWE: CWE-78 (https://cwe.mitre.org/data/definitions/78.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b605_start_process_with_a_shell.html
> Location: ./vulnerable_app.py:46:4
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L45-47
> 45
> 46 os.system("echo 'Commande exécutée: " + user_input + "'")
> 47
> ```

---

> Issue: [B301:blacklist] Pickle and modules that wrap it can be unsafe when used to deserialize untrusted data, possible security issue.
> Severity: Medium Confidence: High
> CWE: CWE-502 (https://cwe.mitre.org/data/definitions/502.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/blacklists/blacklist_calls.html#b301-pickle
> Location: ./vulnerable_app.py:54:15
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L53-55
> 53 with open(filename, "rb") as f:
> 54 data = pickle.load(f)
> 55 return data
> ```

---

> Issue: [B506:yaml_load] Use of unsafe yaml load. Allows instantiation of arbitrary objects. Consider yaml.safe_load().
> Severity: Medium Confidence: High
> CWE: CWE-20 (https://cwe.mitre.org/data/definitions/20.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b506_yaml_load.html
> Location: ./vulnerable_app.py:60:13
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L59-61
> 59 """Parse une configuration YAML."""
> 60 config = yaml.load(config_string)
> 61 return config
> ```

---

> Issue: [B311:blacklist] Standard pseudo-random generators are not suitable for security/cryptographic purposes.
> Severity: Low Confidence: High
> CWE: CWE-330 (https://cwe.mitre.org/data/definitions/330.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/blacklists/blacklist_calls.html#b311-random
> Location: ./vulnerable_app.py:66:12
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L65-67
> 65 """Génère un token."""
> 66 token = random.randint(100000, 999999)
> 67 return str(token)
> ```

---

> Issue: [B608:hardcoded_sql_expressions] Possible SQL injection vector through string-based query construction.
> Severity: Medium Confidence: Low
> CWE: CWE-89 (https://cwe.mitre.org/data/definitions/89.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b608_hardcoded_sql_expressions.html
> Location: ./vulnerable_app.py:88:12
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L87-89
> 87 """Récupère les informations utilisateur."""
> 88 query = "SELECT \* FROM users WHERE id = " + str(user_id)
> 89
> ```

---

> Issue: [B104:hardcoded_bind_all_interfaces] Possible binding to all interfaces.
> Severity: Medium Confidence: Medium
> CWE: CWE-605 (https://cwe.mitre.org/data/definitions/605.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b104_hardcoded_bind_all_interfaces.html
> Location: ./vulnerable_app.py:111:19
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L110-112
> 110
> 111 DEFAULT_HOST = "0.0.0.0"
> 112 DEFAULT_PORT = 8080
> ```

---

> Issue: [B105:hardcoded_password_string] Possible hardcoded password: 'password123'
> Severity: Low Confidence: Medium
> CWE: CWE-259 (https://cwe.mitre.org/data/definitions/259.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b105_hardcoded_password_string.html
> Location: ./vulnerable_app.py:127:23
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L126-128
> 126 if not password:
> 127 password = "password123"
> 128
> ```

---

> Issue: [B105:hardcoded_password_string] Possible hardcoded password: 'backdoor_password'
> Severity: Low Confidence: Medium
> CWE: CWE-259 (https://cwe.mitre.org/data/definitions/259.html)
> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b105_hardcoded_password_string.html
> Location: ./vulnerable_app.py:136:58
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L135-137
> 135 stored_password = self.users[username]["password"]
> 136 if stored_password == password or password == "backdoor_password":
> 137 return True
> ```

---

> Issue: [B101:assert_used] Use of assert detected. The enclosed code will be removed when compiling to optimised byte code.
> Severity: Low Confidence: High
> CWE: CWE-703 (https://cwe.mitre.org/data/definitions/703.html)

> More Info: https://bandit.readthedocs.io/en/1.9.2/plugins/b101_assert_used.html
> Location: ./vulnerable_app.py:158:4
>
> ```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L157-159
> 157
> 158 assert login("admin", "admin123"), "L'authentification devrait réussir"
> 159
> ```

**Statistiques d'analyse Bandit :**

- Code scanned:
  - Total lines of code: 116
  - Total lines skipped (#nosec): 0

- Run metrics:
  - Total issues (by severity):
    - Undefined: 0
    - Low: 8
    - Medium: 4
    - High: 3
  - Total issues (by confidence):
    - Undefined: 0
    - Low: 1
    - Medium: 5
    - High: 9
  - Files skipped (0):

---

## Résumé des Problèmes Récurrents

En analysant les résultats de `flake8`, `pylint`, et `bandit`, voici les problèmes les plus fréquemment détectés dans `vulnerable_app.py` :

### 1. **Variables non utilisées (Critère : 3 occurrences)**

- Détectées par : flake8 (F841), pylint (W0612)
- Fichiers/Lignes :
  - `secret_key` (ligne 33)
  - `password_hash` (ligne 35)
  - `unused_variable` (ligne 72)
- **Problème** : Variables déclarées mais jamais utilisées dans le code

### 2. **Mots de passe codés en dur (Critère : 4 occurrences)**

- Détectées par : bandit (B105)
- Fichiers/Lignes :
  - `'admin123'` (ligne 32)
  - `'super_secret_key_12345'` (ligne 33)
  - `'password123'` (ligne 127)
  - `'backdoor_password'` (ligne 136)
- **Problème** : Risque de sécurité critique - les credentials ne doivent jamais être codés en dur

### 3. **Noms de variables ambigus (Critère : 3 occurrences)**

- Détectées par : flake8 (E741), pylint (C0103)
- Fichiers/Lignes :
  - `l` (lettre minuscule L) - ligne 81
  - `O` (lettre majuscule O) - ligne 81
  - `I` (lettre majuscule I) - ligne 81
- **Problème** : Ces caractères sont facilement confondus avec des chiffres (0, 1) et nuisent à la lisibilité

### 4. **Comparaisons incorrectes avec singleton (Critère : 2 occurrences)**

- Détectées par : flake8 (E712, E711), pylint (C0121)
- Fichiers/Lignes :
  - `DEBUG_MODE == True` (ligne 98) - doit être `DEBUG_MODE is True` ou simplement `DEBUG_MODE`
  - `self.users.get(username) != None` (ligne 134) - doit être `self.users.get(username) is not None`
- **Problème** : Comparaison incorrecte avec les singletons Python

### 5. **Injection de commandes système (Critère : 2 occurrences de HIGH severity)**

- Détectées par : bandit (B602, B605)
- Fichiers/Lignes :
  - `subprocess.call(user_input, shell=True)` (ligne 44)
  - `os.system("echo 'Commande exécutée: " + user_input + "'")` (ligne 46)
- **Problème** : Risque critique d'injection de commandes - utilisation de shell=True sans validation

### 6. **Désérialisation non sécurisée (Critère : 2 occurrences)**

- Détectées par : bandit (B301, B403)
- Fichiers/Lignes :
  - `pickle.load(f)` (ligne 54) - B301
  - Import de `pickle` (ligne 19) - B403
- **Problème** : Pickle peut exécuter du code arbitraire lors de la désérialisation de données non fiables

### 7. **Utilisation de fonctions non sécurisées (Critère : 2 occurrences)**

- Détectées par : bandit (B506)
- Fichiers/Lignes :
  - `yaml.load()` (ligne 60) - doit être `yaml.safe_load()`
- **Problème** : Permet l'instanciation d'objets arbitraires, risque de code injection

### 8. **Longueur de ligne excessive (Critère : 1 occurrence)**

- Détectées par : flake8 (E501), pylint (C0301)
- Fichiers/Lignes :
  - Ligne 25 : 150 caractères (limite : 79-100)
- **Problème** : Réduit la lisibilité et respectabilité du code

### Statistiques Globales des Problèmes

| Type de Problème                | Flake8 | Pylint | Bandit | Total  |
| ------------------------------- | ------ | ------ | ------ | ------ |
| Code Quality (Style, variables) | 9      | 11     | -      | 20     |
| Sécurité (Bandit)               | -      | -      | 15     | 15     |
| **TOTAL**                       | **9**  | **11** | **15** | **35** |

### Priorités de Correction

**🔴 CRITIQUE (Sécurité - Bandit HIGH)** :

- Injection de commandes système (B602, B605)
- Algorithme de hachage faible MD5 (B324)

**🟠 IMPORTANT (Sécurité - Bandit MEDIUM)** :

- Mots de passe codés en dur (B105)
- Désérialisation non sécurisée (B301, B506)
- Injection SQL (B608)

- **🟡 MODÉRÉ** (Code Quality) :

- Variables non utilisées
- Noms ambigus
- Comparaisons incorrectes
- Longueur de lignes

---

## Analyse Détaillée : Erreurs d'Usage de la Fonction `login()`

La fonction `login()` contient plusieurs erreurs critiques d'un point de vue sécurité et logique. Voici une analyse détaillée :

### Fonction Originale :

```/home/liamaugu/Dev/GitHub/formations-devops/intro-devops/vulnerable_app.py#L30-42
def login(username, password):
    """Fonction de connexion."""
    admin_password = os.getenv("ADMIN_PASWWORD")
    secret_key = os.getenv("SECRET_KEY")

    password_hash = hashlib.sha512(password.encode()).hexdigest()

    if username == "admin" and password == admin_password:
        return True
    return False
```

---

### 🔴 ERREUR CRITIQUE #1 : Typo dans la Variable d'Environnement (Ligne 32)

```
admin_password = os.getenv("ADMIN_PASWWORD")
                               ^^^^^^^^^^^
```

**Problème** : `ADMIN_PASWWORD` est mal orthographié (devrait être `ADMIN_PASSWORD`)

**Conséquences** :

- La variable d'environnement n'existera jamais
- `os.getenv()` retournera `None`
- La comparaison `password == None` échouera toujours
- **Aucun utilisateur ne pourra se connecter**, même avec le bon mot de passe

**Exemple de logique** :

```python
# Si on suppose ADMIN_PASSWORD = "secret123"
admin_password = os.getenv("ADMIN_PASWWORD")  # Retourne None (typo!)
password = "secret123"

# La condition suivante échoue :
if username == "admin" and password == None:  # False, car "secret123" != None
    return True
return False  # Toujours atteint, login échoue toujours
```

**Solution** :

```python
admin_password = os.getenv("ADMIN_PASSWORD")  # Correct
```

---

### 🔴 ERREUR CRITIQUE #2 : Utilisation de Variable Non Utilisée (Ligne 33)

```python
secret_key = os.getenv("SECRET_KEY")
```

**Problème** : Cette variable est déclarée mais **jamais utilisée** dans la fonction

**Conséquences** :

- Code mort
- Confusion sur l'intention du programmeur
- Détecté par : flake8 (F841), pylint (W0612)

**Solution** : Supprimer cette ligne si elle est inutile, ou l'utiliser si elle est nécessaire

---

### 🟠 ERREUR LOGIQUE #3 : Hash Calculé mais Jamais Utilisé (Ligne 35)

```python
password_hash = hashlib.sha512(password.encode()).hexdigest()
```

**Problème** : Le hash du mot de passe est calculé mais **jamais utilisé** dans la comparaison

**Conséquences** :

- La fonction compare le mot de passe **en clair** : `password == admin_password`
- Le hash SHA512 est complètement inutile
- Cela veut dire que le mot de passe est comparé en texte brut (anti-pattern de sécurité)
- Détecté par : flake8 (F841), pylint (W0612)

**Ce qu'il faudrait faire** :

```python
# Correct: comparer les hash, pas les mots de passe en clair
password_hash = hashlib.sha512(password.encode()).hexdigest()
stored_hash = hashlib.sha512(admin_password.encode()).hexdigest()

if username == "admin" and password_hash == stored_hash:
    return True
```

**Encore meilleur** : Utiliser bcrypt ou argon2, pas SHA512

```python
import bcrypt

# À l'enregistrement :
hashed = bcrypt.hashpw(password.encode(), bcrypt.gensalt())

# À la connexion :
if bcrypt.checkpw(password.encode(), stored_hashed_password):
    return True
```

---

### 🟠 ERREUR SÉCURITÉ #4 : Comparaison en Texte Clair (Ligne 37-39)

```python
if username == "admin" and password == admin_password:
    return True
```

**Problème** : Les mots de passe sont comparés en texte clair sans hash

**Conséquences** :

- Si le code source est compromis, tous les mots de passe sont exposés
- Pas de protection contre les attaques par dictionnaire
- Anti-pattern grave de sécurité
- Détecté par : bandit (impliquement dans B105)

**Risques** :

- Fuite de credentials en clair dans les logs, backups, ou contrôle de version
- Aucune protection contre une base de données compromise

---

### 🟡 ERREUR LOGIQUE #5 : Dépendance d'une Variable d'Environnement Non Fiable

**Problème** : La fonction dépend d'une variable d'environnement (`ADMIN_PASWWORD`) pour valider le mot de passe

**Conséquences** :

- Si la variable n'existe pas, la fonction retourne toujours `False`
- Pas de gestion d'erreur
- Pas de message d'erreur informatif

**Meilleure approche** :

```python
def login(username, password):
    """Fonction de connexion."""
    admin_password = os.getenv("ADMIN_PASSWORD")

    if not admin_password:
        raise ValueError("Variable ADMIN_PASSWORD non configurée")

    if username == "admin" and password == admin_password:
        return True
    return False
```

---

### Résumé des Erreurs dans `login()` :

| #   | Erreur                             | Type      | Sévérité     | Impact                |
| --- | ---------------------------------- | --------- | ------------ | --------------------- |
| 1   | Typo `ADMIN_PASWWORD`              | Logique   | 🔴 CRITIQUE  | Login toujours échoue |
| 2   | Variable `secret_key` non utilisée | Code mort | 🟡 MODÉRÉ    | Confusion             |
| 3   | Hash SHA512 non utilisé            | Logique   | 🟠 IMPORTANT | Anti-pattern sécurité |
| 4   | Comparaison en texte clair         | Sécurité  | 🔴 CRITIQUE  | Mots de passe exposés |
| 5   | Pas de gestion d'erreur            | Exception | 🟡 MODÉRÉ    | Code instable         |

---

### Version Corrigée de la Fonction :

```python
import hashlib
import os

def login(username, password):
    """Fonction de connexion sécurisée."""
    # Récupérer le mot de passe de l'admin depuis l'environnement
    admin_password = os.getenv("ADMIN_PASSWORD")

    # Vérifier que la variable existe
    if not admin_password:
        raise ValueError("Variable ADMIN_PASSWORD non configurée")

    # Vérifier les credentials
    if username == "admin" and password == admin_password:
        return True

    return False
```

**Améliorations apportées** :

- ✅ Correction de la typo (`ADMIN_PASWWORD` → `ADMIN_PASSWORD`)
- ✅ Suppression du `secret_key` inutilisé
- ✅ Suppression du `password_hash` inutilisé
- ✅ Ajout d'une gestion d'erreur
- ⚠️ **Note** : Le texte clair reste un problème - idéalement utiliser bcrypt
