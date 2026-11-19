# Tests
I usually create 3 test projects, "Developer", "Unit", and "Integration".

## Developer Tests
These are never ran in a pipeline and can be used as scripts or a way to run processes.

## Unit Tests
Unit tests will always fake, stub, and mock depencies. Unit tests should not use a WebApplicationFactory ever. Unit tests are light weight, quick, and efficient. I prefer a mixture of low level solitary tests and social tests that cover end-to-end.

## Integration Tests
These connect to real data sources like SQL Servers, File Systems, Networks, APIs and verifies that they are accessible.

## Project Naming Convention
The projects will all follow convention where it's "ProjectName.Tests.Developer", or "ProjectName.Tests.Unit", or "ProjectName.Tests.Integration". The Project Name is usually something similar to the main project, for example "MrJB.API" would produce "MrJB.Tests.Unit" for Unit Tests.

## NuGet Packages
All test prjects should use these NuGet packages.
- FakeItEasy
- Shouldly
- XUnit V3

For Integration Tests they should also include the TestContainers and Respawn NuGet.