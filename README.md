
# Description

Run a stateless NuGet Server (java) and store NuGet Packages on Amazon S3.

# Run

```
sudo docker run -ti \
     -v <jnuget-config-folder>:/data \
     -e AWS_IAM_ROLE=<IAM-Role>
     -e S3BUCKET=<Bucket-Name> \
     -e S3PATH=<Bucket-Path> \
     --rm \
     -p 8080:8080 \
     --privileged \
     docker-nuget-server
```

Then NuGet repository will be available on `http://<host>:8080/jnuget/storages/DefaultSource` URL.


```
nuget list -Source http://<host>:8080/jnuget/storages/DefaultSource
nuget push <package> -Source http://<host>:8080/jnuget/storages/DefaultSource
nuget install <package> -Source http://<host>:8080/jnuget/storages/DefaultSource
```

