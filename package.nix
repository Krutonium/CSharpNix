{
  buildDotnetModule,
  dotnetCorePackages,
}:

buildDotnetModule {
  pname = "ProjectName";
  version = "0.1.0"; 

  src = ./.;

  projectFile = "Project/Project.csproj";
  # Above can be a path to .csproj OR if there's a default project, the .sln

  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.runtime_10_0;
  # Update the above to Match your .NET version
  
  nugetDeps = ./deps.json;
  # Feel free to remove this line if there is no deps.json needed
  executables = [ "ProjectName" ]; # This needs to match the name of the binary in the `bin` folder after you've built the application

  meta = {
    description = "Description of the Project";
    homepage = "https://example.invalid";
    license = null;
  };
}
