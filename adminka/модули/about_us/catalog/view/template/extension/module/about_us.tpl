<section class="information">
  <?php if ($description) { ?>
    <div class="information__wrapper">
      <div class="information__inner">
        <img src="image/information/information-left.jpg" class="information__hard">
      </div>
      <div class="information__design">
        <img class="information__design-logoimg" src="image/information/logo.png">
        <div class="information__design-box">
          <img class="information__design-image" src="image/information/anonim.png">
          <img class="information__design-image-model" src="image/information/anonim-model.png">
          <p class="information__text">
            <?php echo $title_primary; ?>
          </p>
          <p class="information__design-text">
            <?php echo $description_primary; ?>
          </p>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="information__content">
        <?php foreach ($description as $item) { ?>
          <?php if ($item['position'] == 0) { ?>
            <div class="information__content-wrapper">
              <img class="information__content-image" src="<?php echo $item['image']; ?>" alt="Image">
              <?php echo $item['description']; ?>
            </div>
          <?php } else { ?>
            <div class="information__content-wrapper">
              <?php echo $item['description']; ?>
              <img class="information__content-image" src="<?php echo $item['image']; ?>" alt="Image">
            </div>
          <?php } ?>
        <?php } ?>
      </div>
    </div>
  <?php } ?>

  <?php if ($css != '') { ?>
    <style>
      <?php echo $css; ?>@media(max-width: 767px) {
        .content-ltr .information-box {
          margin-left: -15px;
          margin-right: -15px;
        }
      }
    </style>
  <?php } ?>

  <style>
    .information-information_onas .breadcrumb,
    .information-information_onas #content h1,
    .information-information_onas .buttons.clearfix {
      display: none;
    }

    .information-information_onas>.container {
      max-width: 100%;
    }
  </style>
</section>