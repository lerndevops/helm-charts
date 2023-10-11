# Helm Charts Sign and Verify using gnupg

> **GnuPG allows to encrypt and sign your data and communication, features a versatile key management system as well as access modules for all kinds of public key directories.** 

> **GnuPG, also known as GPG, is a command line tool with features for easy integration with other applications**

- [GnuPG](https://gnupg.org/)
- Generating Private/Public Keys with gpg
- Sign the Helm Package 
- Export public key
- Verify Helm Package using Public Key

## Install gnupg 

### Install gnupg on Linux ubuntu/debian
```sh
# Install gnupg on ubuntu
sudo apt-get update
sudo apt-get install -y gnupg
```
```sh
# Verify version
gpg --version
```

### Install gnupg on MacOS
- [Install gnupg using homebrew](https://formulae.brew.sh/formula/gnupg)
```sh
# Install gnupg on MacOS
brew install gnupg
```
```sh
# Verify version
gpg --version
```

### Install gnupg on WindowsOS
- [Install gnupg on windows using chocolatey](https://community.chocolatey.org/packages/gnupg#individual)
```sh
# Install gnupg on WindowsOS
choco install gnupg
```
```sh
# Verify version
gpg --version
```

## Generate Private/Public Key Pairs with gpg
```sh

# Generating Private/Public Keys with gpg

gpg --full-generate-key
-> kind of key: Select 1 (1) RSA and RSA
-> What keysize do you want? (3072) 
-> Please specify how long the key should be valid.
-> Key is valid for? (0) "0 = key does not expire"
-> Is this correct? (y/N) 
-> Real name: helmsigndemo
-> Email address: naresh@gmail.com
-> Comment: Keys used to sign Helm Charts
-> Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
-> Passphrase: today@1234
```
```sh
# List Keys
gpg --list-keys
```
```sh
# Convert new secret keyring to old format
gpg --export-secret-keys >~/.gnupg/demo-privatekey.gpg
Passphrase: today@1234

Note:
  1. To sign charts, Helm currently prefers the older format. 
  2. Convert the new secret keyring format to the old format and store it in a file called secring.
```
```sh
# Verify if file created
ls ~/.gnupg/demo-privatekey.gpg
```
```sh
# Copy the private key to a charts directory

mkdir -p $HOME/charts ; mkdir -p $HOME/charts/private-key ; mkdir -p $HOME/charts/public-key ; cd $HOME/charts
cp ~/.gnupg/demo-privatekey.gpg $HOME/charts/private-key/
```
```sh
## add a helm chart to charts directory  
helm repo add lerndevops https://lerndevops.github.io/helm-charts/
helm search repo lerndevops

helm pull lerndevops/sampleapp --version 0.2 --untar

```
```sh
# Export private key with single command (instead of export in .gnupg folder and copy to private-key folder)
cd $HOME/charts
gpg --export-secret-keys > private-key/demo-privatekey.gpg
```

## Sign the Helm Chart now
```sh
# Change Directory
cd $HOME/charts

# Sign & Package Helm Chart 
helm package --sign --key 'helmsigndemo' --keyring private-key/demo-privatekey.gpg sampleapp/
Passphrase: today@1234
```
```sh
# Verify the Provenance file created
ls -lrta $HOME/charts
1. We should find the file "sampleapp-0.2.tgz.prov" ending with ".prov"
```
### [what-is-prov-file](https://helm.sh/docs/topics/provenance/)


## Export Public Key

- **Verify integrity of chart using public key**
- **In real-world scenario, these public keys will be published on keyservers (keyserver.ubuntu.com, keyserver.openpgp.com)**
- **We should download these public keys to verify the integrity of the chart.**

```sh
# Change to Directory 
cd $HOME/charts

# Export Public Key
gpg --export 'helmsigndemo' > public-key/demo-publickey.gpg

# Verify if file created
ls public-key/demo-publickey.gpg
```

## Verify Helm Package using Public Key
```sh
# Change Directory
cd $HOME/charts

# Helm Verify
helm verify --keyring public-key/demo-publickey.gpg sampleapp-0.2.tgz

## Sample Output
Signed by: helmsigndemo (Keys used to sign Helm Charts) <naresh@gmail.com>
Using Key With Fingerprint: 6D60338C4C1DD80344F054579EBAD7E4471C77B1
Chart Hash Verified: sha256:7ec1e342fe69af153213751aac6172f2f9b5ec78666fc4eb7ef0248fdb6cc47b
```


## Verify Charts during helm install and Upgrade - Positive Test
```sh
# Change Directory
cd $HOME/charts

# Helm Install with --verify 
helm install sapp sampleapp-0.2.tgz --verify --keyring public-key/demo-publickey.gpg --atomic
```
```sh
# List Helm Release
helm list

# Helm Status
helm status --show-resources
```
```sh
# Helm Upgrade with --verify 
helm upgrade sapp sampleapp-0.3.tgz --verify --keyring public-key/helmsigndemo1-publickey.gpg --atomic
```
```sh
# Uninstall Helm Release
helm uninstall sapp
```

## Verify Charts during helm install and Upgrade - Negative Test
```sh
# Change Directory
cd $HOME/charts

# Create some dummy file in public-key folder
touch public-key/dummy-publickey.gpg
```
```sh
# Helm Install with --verify 
helm install sapp sampleapp-0.2.tgz --verify --keyring public-key/dummy-publickey.gpg --atomic
```
```sh
Observation:
   1. Should throw an error as below

## Sample Output
Error: INSTALLATION FAILED: openpgp: signature made by unknown entity
```