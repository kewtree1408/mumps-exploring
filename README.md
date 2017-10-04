# mumps-exploring
```
docker-compose up --build -d
```

```
docker exec -it mumpsexploring_mumps bash
```

```
root@33dce04c88ad:/tmp/gtm# gtm

GTM>WRITE "Hello, world"
Hello, world
GTM>WRITE !,"Hello, world"

Hello, world

GTM> hult
root@33dce04c88ad:/tmp/gtm#


root@33dce04c88ad:/tmp/gtm# mumps

Mumps Native client version 17.11 Hardware Math: no
http://threadsafebooks.com/
Enter HALT to exit

GTM>WRITE !,"Hello, world"

Hello, world
GTM>> hult
root@33dce04c88ad:/tmp/gtm# mumps

```
