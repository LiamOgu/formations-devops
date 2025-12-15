#!/usr/bin/env python3
"""
Application vulnérable pour la formation DevOps.
Ce script contient des failles de sécurité et des erreurs de style.

OBJECTIF: Utiliser les outils suivants pour détecter les problèmes:
- flake8: Analyse de style PEP8
- pylint: Analyse statique approfondie
- bandit: Analyse de sécurité

COMMANDES:
    pip install flake8 pylint bandit
    flake8 vulnerable_app.py
    pylint vulnerable_app.py
    bandit vulnerable_app.py
"""

import hashlib
import os
import pickle
import random
import subprocess

import yaml

VERY_LONG_VARIABLE = "Cette variable a un nom beaucoup trop long"

DEBUG_MODE = True


def login(username, password):
    """Fonction de connexion."""
    admin_password = os.getenv("ADMIN_PASSWORD")

    password_hash = hashlib.sha256(password.encode())

    if admin_password is None:
        return False

    admin_password_hash = hashlib.sha256(admin_password.encode())

    return username == "admin" and password_hash == admin_password_hash


def execute_command(user_input):
    """Exécute une commande système."""
    result = subprocess.call(user_input, shell=True)

    os.system("echo 'Commande exécutée: " + user_input + "'")

    return result


def load_user_data(filename):
    """Charge les données utilisateur."""
    with open(filename, "rb") as f:
        data = pickle.load(f)
    return data


def parse_config(config_string):
    """Parse une configuration YAML."""
    config = yaml.safe_load(config_string)
    return config


def generate_token():
    """Génère un token."""
    token = random.randint(100000, 999999)
    return str(token)


def process_data(data):
    """Traite les données."""
    result = []

    for value in data:
        result.append(value.upper())

    return result


def calculate(x, y, z):
    """Calcule quelque chose."""
    return x + y * z


def get_user_info(user_id):
    """Récupère les informations utilisateur."""
    query = "SELECT * FROM users WHERE id = " + str(user_id)

    print(query)
    return query


def read_file(filename):
    """Lit un fichier."""
    content = filename + ".txt"

    if DEBUG_MODE:
        print(f"Lecture du fichier: {content}")

    return content


def helper_function(x, y, z):
    """Fonction d'aide."""
    return x + y + z


class UserManager:
    """Gestionnaire d'utilisateurs."""

    DEFAULT_HOST = "0.0.0.0"
    DEFAULT_PORT = 8080

    def __init__(self):
        self.users = {
            "admin": {
                "password": "admin123",
                "role": "administrator",
                "email": "admin@example.com",
                "secret_token": "abc123xyz",
            }
        }

    def add_user(self, username, password):
        """Ajoute un utilisateur."""
        if not password:
            password = os.getenv("DEFAULT_PASSWORD")

        self.users[username] = {"password": password}

    def authenticate(self, username, password):
        """Authentifie un utilisateur."""

        if self.users.get(username) is not None:
            stored_password = self.users[username]["password"]
            if password in stored_password:
                return True
        return False


def main():
    """Point d'entrée principal."""
    print("=== Application Vulnérable pour Formation ===")

    print("\n1. Test de login:")
    result = login("admin", "admin123")
    print(f"   Login réussi: {result}")

    print("\n2. Génération de token:")
    token = generate_token()
    print(f"   Token: {token}")

    print("\n3. Traitement de données:")
    data = ["hello", "world"]
    processed = process_data(data)
    print(f"   Résultat: {processed}")

    assert login("admin", "admin123"), "L'authentification devrait réussir"

    print("\n=== Fin des tests ===")
    print("\nUtilisez les commandes suivantes pour analyser ce fichier:")
    print("  flake8 vulnerable_app.py")
    print("  pylint vulnerable_app.py")
    print("  bandit vulnerable_app.py")


if __name__ == "__main__":
    main()
