{
  rev,
  lib,
  stdenvNoCC,
  makeWrapper,
  installShellFiles,
  fish,
  openssh,
  rsync,
  coreutils,
  gcc,
}: let
  runtimeDeps = [fish openssh rsync coreutils gcc];
in
  stdenvNoCC.mkDerivation {
    pname = "cse";
    version = "${rev}";
    src = ./.;

    nativeBuildInputs = [makeWrapper installShellFiles];
    propagatedBuildInputs = runtimeDeps;

    patchPhase = ''
      substituteInPlace cse \
        --replace-fail '$src/tests' "$src/tests" \
        --replace-fail "echo 'Updating...'" "echo 'Self updates are not available on NixOS.'; exit 1" \
        --replace-fail 'dcc --valgrind --leak-check' 'gcc'
    '';

    installPhase = ''
      install -Dm755 cse $out/bin/cse
      wrapProgram $out/bin/cse --prefix PATH : ${lib.makeBinPath runtimeDeps}
    '';

    postInstall = "installShellCompletion completions/cse.fish";

    meta = {
      description = "A helper script for UNSW CSE students";
      homepage = "https://github.com/soramanew/cse";
      mainProgram = "cse";
      platforms = lib.platforms.linux;
    };
  }
