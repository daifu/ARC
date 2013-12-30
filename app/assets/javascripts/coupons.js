var ARC_Coupons = Arc4em.extend({
  init: function(options) {
    this.expired_at = $('.expired_at');
    this._super();
  },
  init_datepicker: function() {
    this.expired_at.datetimepicker({
      language: 'en',
      pick12HourFormat: true
    });
  }
});