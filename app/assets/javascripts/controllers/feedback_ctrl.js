app.controller('FeedbacksCtrl', ['Feedback', 'action', function (Feedback, action) {
    var ctrl = this;
    ctrl.showForm = false;
    ctrl.activateForm = activateForm;

    function activateForm() {
      ctrl.showForm = true;
    }
    // Код отработает только для  '/feedbacks'
    action('index', function(){
      ctrl.feedbacks = Feedback.query();
    });

    // Вызовется для паттерна '/posts/:id'
    action('show', function (params){
      ctrl.feedback = Feedback.get({id: params.id});
    });

    // Только для '/posts/new'
    action('new', function(){
      ctrl.feedback = Feedback.new();
      // Присваивание каллбека создания, который будет вызван автоматически при сабмите формы. См. ниже.
      ctrl.save = Feedback.create;
    });

    // Для паттерна '/posts/:id/edit'
    action('edit', function (params){
      ctrl.feedback = Feedback.edit({id: params.id});
      // Аналогичное присваивание для каллбека обновления
      ctrl.save = Feedback.update;
    })

    // Общий код. Вызовется для двух методов edit и new.
    action(['edit', 'new'], function(){
      //
    })

    action(['index', 'edit', 'show'], function () {
      ctrl.destroy = function (feedback) {
        Feedback.destroy({id: feedback.id}, function () {
          ctrl.feedbacks = _.select(ctrl.feedbacks, function (_feedback) {
            return _feedback.id != feedback.id
          })
        })
      }
    })

    // Так же внутри ресурса routes.rb можно создать свой кастомный метод. Вызовется для: '/posts/some_method'
    action('some_method', function(){
      //
    })

    // etc
  }])
