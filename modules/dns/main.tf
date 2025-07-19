
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_zone" "domain" {
  zone = var.domain
  account_id = ""
}

resource "cloudflare_record" "alb_dns" {
  zone_id = cloudflare_zone.domain.id
  name    = var.record_name
  type    = "CNAME"
  value   = var.alb_dns_name
  ttl     = 300
  proxied = true
}

resource "cloudflare_page_rule" "cache" {
  zone_id  = cloudflare_zone.domain.id
  target   = "https://${var.domain}/*"
  actions {
    cache_level = "Cache Everything"
  }
}

resource "cloudflare_filter" "bad_bot_filter" {
  zone_id    = cloudflare_zone.domain.id
  expression = "(http.user_agent contains \"badbot\")"
  description = "Filter for bad bots"
}

resource "cloudflare_firewall_rule" "basic_waf" {
  zone_id     = cloudflare_zone.domain.id
  filter_id   = cloudflare_filter.bad_bot_filter.id
  description = "Block bad bots"
  action      = "block"
}