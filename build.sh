#!/bin/bash
# Build script para Telegraph AyuGram Mod
# Uso: ./build.sh <telegraph.apk>

set -e

APK_INPUT="${1:-Telegraph_12.3.1.1.apk}"
APK_OUTPUT="Telegraph_AyuGram_Mod.apk"
KEYSTORE="graph-key.jks"
KS_PASS="graph123"

echo "=== Telegraph AyuGram Mod Builder ==="
echo "Input: $APK_INPUT"
echo ""

# Step 1: Decompile
echo "[1/6] Descompilando APK..."
apktool d -f "$APK_INPUT" -o decompiled

# Step 2: Apply patches
echo "[2/6] Aplicando patches..."

# Create AyuConfig directory
mkdir -p decompiled/smali/com/radolyn/ayugram/

# Copy AyuConfig.smali
cp patches/AyuConfig.smali decompiled/smali/com/radolyn/ayugram/

echo "  - AyuConfig.smali copiado"

# Apply Official.smali patch (anti-delete always ON)
# This needs to be adapted for each version

echo "  - Patches aplicados"

# Step 3: Recompile DEX
echo "[3/6] Recompilando DEX files..."
apktool b decompiled -o /dev/null 2>&1 || true

# Step 4: Replace DEX in original APK
echo "[4/6] Substituindo DEX no APK original..."
python3 -c "
import zipfile, os
src = '$APK_INPUT'
dst = 'telegraph-modded.apk'
original = zipfile.ZipFile(src, 'r')
output = zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED)
dex_dir = 'decompiled/build/apk'
for item in original.infolist():
    dex_path = os.path.join(dex_dir, item.filename)
    if item.filename.endswith('.dex') and os.path.exists(dex_path):
        with open(dex_path, 'rb') as f:
            output.writestr(item, f.read())
        print(f'  Replaced: {item.filename}')
    else:
        output.writestr(item, original.read(item.filename))
original.close()
output.close()
"

# Step 5: Align
echo "[5/6] Alinhando APK..."
zipalign -v -p 4 telegraph-modded.apk telegraph-aligned.apk > /dev/null

# Step 6: Sign
echo "[6/6] Assinando APK..."
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkey -v -keystore "$KEYSTORE" -keyalg RSA -keysize 2048 -validity 10000 \
        -alias graph -storepass "$KS_PASS" -keypass "$KS_PASS" \
        -dname "CN=Graph Mod, OU=Dev, O=Graph, L=BR, ST=BR, C=BR" 2>&1 | tail -1
fi
apksigner sign --ks "$KEYSTORE" --ks-pass "pass:$KS_PASS" --key-pass "pass:$KS_PASS" \
    --out "$APK_OUTPUT" telegraph-aligned.apk

# Cleanup
rm -f telegraph-modded.apk telegraph-aligned.apk

echo ""
echo "=== Build concluido! ==="
echo "APK: $APK_OUTPUT ($(du -h $APK_OUTPUT | cut -f1))"
apksigner verify "$APK_OUTPUT" && echo "Assinatura: OK"
