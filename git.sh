# Configure git to always ssh when dealing with https github repos
git config --global url."git@github.com:".insteadOf https://github.com/
# Set Git to store credentials in Keychain
git config --global credential.helper osxkeychain
# Set git display name and email
if [ -n "$(git config --global user.email)" ]; then
  echo "✔ Git email is set to $(git config --global user.email)"
else
  read -p 'What is your Git email address?: ' gitEmail
  git config --global user.email "$gitEmail"
fi

if [ -n "$(git config --global user.name)" ]; then
  echo "✔ Git display name is set to $(git config --global user.name)"
else
  read -p 'What is your Git display name (Firstname Lastname)?: ' gitName
  git config --global user.name "$gitName"
fi
