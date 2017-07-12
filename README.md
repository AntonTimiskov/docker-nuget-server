
# Description

Run a stateless NuGet Server (java) and store NuGet Packages on a volume intended to be rexray.

# Run

```
sudo docker run -ti \
     -v <jnuget-config-folder>:/data \
     -v <jnuget-packages-folder>:/data/Packages \
     --rm \
     -p 8080:8080 \
     docker-nuget-server
```

Works best if behind reverse proxy such as <http://proxy.dockerflow.com/>.  
Then NuGet repository will be available on `http://<host>:8080/storages/DefaultSource` URL.


```
nuget list -Source http://<host>:8080/storages/DefaultSource
nuget push <package> -Source http://<host>:8080/storages/DefaultSource
nuget install <package> -Source http://<host>:8080/storages/DefaultSource
```

