export function updateImageUrl(context, url) {
  console.log('committing ' + url)
  context.commit("updateImageUrl", url);
}

export function updateRoute(context, route) {
    context.commit("updateRoute", route);
}
