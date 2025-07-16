{
  rev,
  lib,
  stdenvNoCC,
  installShellFiles,
  fish,
}:
stdenvNoCC.mkDerivation {
  pname = "cse";
  version = "${rev}";
  src = ./.;

  nativeBuildInputs = [installShellFiles];
  buildInputs = [fish];

  installPhase = "install -Dm755 cse $out/bin/cse";
  postInstall = "installShellCompletion completions/cse.fish";

  meta = {
    description = "A helper script for UNSW CSE students";
    homepage = "https://github.com/soramanew/cse";
    mainProgram = "cse";
    platforms = lib.platforms.linux;
  };
}
