import { QuartzComponentConstructor } from "../types"

function NotFound() {
  return (
    <article class="popover-hint">
      <h1>😅哎呦喂呀</h1>
      <p>当前页面是私有的或不存在</p>
      <p>您可以<a href="javascript:history.back(-1)">返回上一页</a>，或者<a href="/">返回首页</a></p>
    </article>
  )
}

export default (() => NotFound) satisfies QuartzComponentConstructor
