---
name: LaTeX to Quarto Publisher
description: >
  LaTeX notlarını `.qmd`'ye çevirir, render eder, hataları issue olarak bildirir
  ve render edilmiş çıktıları başka repoya (`turanonur.git`) gönderir.
instructions: |
  1. Depodaki tüm `.tex` dosyalarını ara.
  2. Her biri için bir `.qmd` dosyası oluştur.
  3. LaTeX biçimlendirme hatalarını belirle ama düzeltme yapma — onun yerine issue aç.
  4. Quarto'yu çalıştırarak `.html` dosyaları üret.
  5. HTML çıktıları `turanonur.git` deposunun `gh-pages/academic/` altına yükle.
  6. Her gün bir rapor oluştur ve e-posta gönder.
tools:
  - github
  - quarto
permissions:
  - read: contents
  - write: contents
  - read: issues
  - write: issues
  - write: discussions
  - write: workflows
  - external-repo: turanonur.git
schedule:
  - cron: "0 6 * * *"  # her sabah 06:00'da
notifications:
  email:
    to: "onurturan.t@gmail.com"
    subject: "Günlük Akademik Yayın Raporu"
