{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "snavi";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "yueyinqiu";
    repo = "Snavi";
    rev = "v${finalAttrs.version}";
    hash = "sha256-qL8MW7QS0/Ybj3S1tDyYD8W7WuS5nW+VAqZbt6F5brI=";
  };

  projectFile = "src/Snavi/Snavi.csproj";
  dotnet-sdk = dotnetCorePackages.sdk_10_0;

  nugetDeps = ./deps.nix;

  strictDeps = true;
  __structuredAttrs = true;

  meta = {
    description = "A navi-like interactive cheatsheet tool for the command line, with fzf";
    homepage = "https://github.com/yueyinqiu/Snavi";
    license = lib.licenses.mit;
    mainProgram = "Snavi";
    maintainers = [ ];
  };
})
