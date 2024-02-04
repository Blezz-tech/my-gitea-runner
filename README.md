
## build

```bash
docker build -t gitea.blezz-tech.ru/blezz-tech/actions .
```

## push

```bash
docker push gitea.blezz-tech.ru/blezz-tech/actions
```

## run

```bash
docker run -it gitea.blezz-tech.ru/blezz-tech/actions bash
```

## build with nix

```bash
nix build .#app && docker load < result && docker run -it gitea.blezz-tech.ru/blezz-tech/actions bash
```


