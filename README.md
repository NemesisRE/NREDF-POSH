# NREDF-POSH

## Manual Installation

1. Checkout the repository into your profile directory

1. Add the following snippet at the top of your profile

    ```powershell
    # Load NRE Dotfiles
    ${PROFILE_PATH} = (Get-Item $PROFILE).Directory
    ${NREDF_PATH} = "${PROFILE_PATH}\NREDF-POSH"
    . "${NREDF_PATH}\Profile.ps1"
    ```

1. Import `NREDF-POSH.sst` to your Trusted Publisher cert store

## Scripted Installation

Run the following snippet

```powershell
$PROFILE_PATH = (Get-Item $PROFILE).Directory
cd $PROFILE_PATH
git clone "https://github.com/NemesisRE/NREDF-POSH.git"
$PROFILE_CONTENT = Get-Content $PROFILE
'# Load NRE Dotfiles
${PROFILE_PATH} = (Get-Item $PROFILE).Directory
${NREDF_PATH} = "${PROFILE_PATH}\NREDF-POSH"
. "${NREDF_PATH}\Profile.ps1"'| Out-File -FilePath $PROFILE -Force
$PROFILE_CONTENT | Out-File -FilePath $PROFILE -Append -Force
$CERT_FILE = (Get-ChildItem -Path $PROFILE_PATH\NREDF-POSH\NREDF-POSH.sst)
$CERT_FILE | Import-Certificate -CertStoreLocation Cert:\CurrentUser\TrustedPublisher
```
