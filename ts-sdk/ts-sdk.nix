_: {
  perSystem =
    {
      pkgsUnstable,
      lib,
      self',
      ...
    }:
    let
      packageJson = lib.importJSON ./package.json;
    in
    {
      packages = {
        ts-sdk = pkgsUnstable.buildNpmPackage {
          pname = packageJson.name;
          inherit (packageJson) version;
          src = ./.;
          npmDepsHash = "sha256-xUa3OuhVRCM47gyufJb0kU/apuMlQ7va1jlHn6ZN5nQ=";
          doCheck = true;
          checkPhase = ''
            npm run test
          '';
        };

      };
      apps.publish-ts-sdk = {
        type = "app";
        program = pkgsUnstable.writeShellApplication {
          name = "publish-ts-sdk";
          text = ''
            cd ${self'.packages.ts-sdk}/lib/node_modules/@unionlabs/sdk
            ${pkgsUnstable.nodejs}/bin/npm publish --access='public' --no-git-tagsh
          '';
        };

      };
    };
}
