<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Bienvenido</title>
    <meta name="author" content="SitePoint">
    <?php $this->load->view('css'); ?>
</head>
<body>
    <nav class="navbar navbar-default" role="navigation">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-ex1-collapse">
        <span class="sr-only">Desplegar</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Home</a>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php 
                        if(!empty($this->session->userdata('name')))
                            echo 'Nombre: '.$this->session->userdata('name');
                    ?><b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                    <li><a>
                    <?php 
                        if(!empty($this->session->userdata('rol')))
                            echo $this->session->userdata('rol');
                    ?>
                    </a></li>
                    <li class="divider"></li>
                    <li><a href="<?php echo base_url().'index.php/UserController/logout';?>">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <ul class="nav nav-tabs" id="myTab" role="tablist">

                    <?php
                        $this->db->select('DATE_FORMAT(answers.created, "%m-%Y") as month_year');
                        $this->db->from('answers');
                        $this->db->where('users_id', $this->session->userdata('user_id'));
                        $this->db->order_by('created', 'desc');
                        $this->db->limit(1);
                        $res = $this->db->get()->result_array();

                        if(!empty($res[0]['month_year']))
                        {
                            if(date('m-Y') != $res[0]['month_year'])
                            { ?>
                                <li class="nav-item">
                                    <a class="nav-link active" id="form-tab" data-toggle="tab" href="#form" role="tab" aria-controls="form" aria-selected="true">Formulario</a>
                                </li>    
                            <?php 
                            }
                        }
                        else
                        {
                        ?>
                            <li class="nav-item">
                                <a class="nav-link active" id="form-tab" data-toggle="tab" href="#form" role="tab" aria-controls="form" aria-selected="true">Formulario</a>
                            </li>
                        <?php
                        }
                        ?>

                    <li class="nav-item">
                        <a class="nav-link" id="sent-tab" data-toggle="tab" href="#sent" role="tab" aria-controls="sent" aria-selected="false">Enviados</a>
                    </li>
                    <?php
                    if($this->session->userdata("roles_id") == 1)
                    {
                        //validacion por rol
                    ?>
                    <li class="nav-item">
                        <a class="nav-link" id="chart-tab" data-toggle="tab" href="#chart" role="tab" aria-controls="chart" aria-selected="false">Estadística</a>
                    </li>
                    <?php
                    }
                    ?>

                </ul>

                <div class="tab-content" id="myTabContent">

                    <div class="tab-pane fade active" id="form" role="tabpanel" aria-labelledby="form-tab">
                        <br>
                        <fieldset>
                            <legend>Formulario <?php echo $form[0]['form']?></legend>
                            <?php echo $form[0]['description']?>
                            <?php
                                if(!empty($form_questions))
                                {

                                    echo '<table class="table table-bordered">';
                                    foreach($form_questions as $fq)
                                    {
                                        if($fq['number'] == 1)
                                        {
                                            echo '<tr>';
                                            echo '<td>'.$fq['number'].'</td>';
                                            echo '<td>'.$fq['question'].'</td>';
                                            echo '<td><input type="text" class="form-control" id="q-'.$fq['id'].'" name="q-'.$fq['id'].'"><td>';
                                            echo '</tr>';
                                        }
                                        else if($fq['number'] == 2)
                                        {
                                            echo '<tr>';
                                            echo '<td>'.$fq['number'].'</td>';
                                            echo '<td>'.$fq['question'].'</td>';
                                            echo '<td>
                                            <select class="form-control" id="q-'.$fq['id'].'" name="q-'.$fq['id'].'">
                                                <option value="SI">SI</option>
                                                <option value="NO">NO</option>
                                                <option value="Más o Menos">Más o Menos</option>
                                            </select>
                                            <td>';
                                            echo '</tr>';
                                        }
                                        else
                                        {
                                            echo '<tr>';
                                            echo '<td>'.$fq['number'].'</td>';
                                            echo '<td>'.$fq['question'].'</td>';
                                            echo '<td>
                                                <select class="form-control" id="q-'.$fq['id'].'" name="q-'.$fq['id'].'">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                            <td>';
                                            echo '</tr>';
                                        }
                                       
                                    }
                                    echo '<tr><td colspan="3"><button class="btn btn-success" onclick="sendForm();">Enviar</button></td></tr>';
                                    echo '</table>';
                                }
                            ?>
                        </fieldset>
                    </div>

                    <div class="tab-pane fade" id="sent" role="tabpanel" aria-labelledby="sent-tab">
                        <fieldset>
                                <legend>Envíos Realizados Fecha</legend>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Pregunta</th>
                                            <th>Respuesta</th>
                                            <th>Usuario</th>
                                            <th>Fecha</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody-answers">

                                    </tbody>
                                </table>
                        </fieldset>
                    </div>

                    <?php
                    if($this->session->userdata("roles_id") == 1)
                    {
                        //validacion por rol
                    ?>
                    <div class="tab-pane fade" id="chart" role="tabpanel" aria-labelledby="chart-tab">
                         <fieldset>
                            <legend>Gráfico</legend>

                            <div id="piechart" style="width: 100%; height: 500px;"></div>
                        </fieldset>
                    </div>
                    <?php
                    }
                    ?>
                </div>

            </div>
        </div>
    </div>
    
    <?php $this->load->view('js'); ?>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script>
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        $(document).ready(function() {
            <?php

            if(!empty($res[0]['month_year']))
            {
                //echo '<h1>'.$res[0]['month_year'].'</h1>';
                if(date('m-Y') != $res[0]['month_year'])
                { ?>
                    $("#form-tab").trigger("click");  
                <?php 
                }
                else
                {?>
                    $("#sent-tab").trigger("click");
                <?php
                }
            }
            else
            {
            ?>
                $("#form-tab").trigger("click");
            <?php
            }
            ?>

            


            loadSent();
        });

        function sendForm()
        {
            let answer_1 = $('#q-1').val();
            let answer_2 = $('#q-2').val();
            let answer_3 = $('#q-3').val();

            if(answer_1.trim() == '' || answer_1.trim().length == 0)
            {
                //vacio la respuesta 1
                alert('Debe ingresar contenido en la pregunta 1');
                $('q-1').focus();
            }
            else
            {
                //no hay campo vacios
                $.ajax({
                    url: '<?php echo base_url();?>index.php/FormsController/addAnswers',
                    type: 'post',
                    data: {a_1: answer_1, a_2: answer_2, a_3: answer_3},
                    dataType: 'text',
                    success: function(response)
                    {
                        if(response == '1')
                        {
                            alert('Encuesta enviada.');
                            location.reload();
                        }
                    }
                });
            }
        }

        function loadSent()
        {
            let rol_id = '<?php echo $this->session->userdata("roles_id");?>';
            let tbody = '';

            if(rol_id == 1)
            {
                //cargar todo
                $.ajax({
                    url: '<?php echo base_url();?>index.php/FormsController/getAllAnswers',
                    dataType: 'json',
                    success: function(response)
                    {
                        if(response != null && response.length > 0)
                        {
                            for(let i=0; i<response.length; i++)
                            {
                                tbody += '<tr>';
                                tbody += '<td>'+response[i]['number']+'</td>';
                                tbody += '<td>'+response[i]['question']+'</td>';
                                tbody += '<td>'+response[i]['answer']+'</td>';
                                tbody += '<td>'+response[i]['name']+'</td>';
                                tbody += '<td>'+response[i]['created']+'</td>';
                                tbody += '</tr>';
                            }

                            $('#tbody-answers').html(tbody);
                        }
                        
                    }
                });
            }
            else
            {
                //cargar solo mis intentos
                $.ajax({
                    url: '<?php echo base_url();?>index.php/FormsController/getAnswers_User',
                    dataType: 'json',
                    success: function(response)
                    {
                        if(response != null && response.length > 0)
                        {
                            for(let i=0; i<response.length; i++)
                            {
                                tbody += '<tr>';
                                tbody += '<td>'+response[i]['number']+'</td>';
                                tbody += '<td>'+response[i]['question']+'</td>';
                                tbody += '<td>'+response[i]['answer']+'</td>';
                                tbody += '<td>'+response[i]['name']+'</td>';
                                tbody += '<td>'+response[i]['created']+'</td>';
                                tbody += '</tr>';
                            }

                            $('#tbody-answers').html(tbody);
                        }
                        
                    }
                });
            }
        }

        function drawChart() 
        {
            <?php
            if($this->session->userdata("roles_id") == 1)
            {
                //validacion por rol admin solo puede ver el pie chart
            ?>
                $.ajax({
                    url: '<?php echo base_url();?>index.php/FormsController/count_answers',
                    dataType: 'json',
                    success: function(response)
                    {
                        
                        let SI = 0;
                        let NO = 0;
                        let MAS = 0;

                        if(response['SI'] != null)
                            SI = response['SI'][0]['count_answer'];
                        
                        if(response['NO'] != null && response['NO'].length > 0)
                            NO = response['NO'][0]['count_answer'];

                        if(response['MAS'] != null && response['MAS'].length > 0)
                            MAS = response['MAS'][0]['count_answer'];

                        SI = parseInt(SI);
                        NO = parseInt(NO);
                        MAS = parseInt(MAS);

                        //por tiempo no alcanzo a parsear los datos asi q lo dejo en duro...

                        var data = google.visualization.arrayToDataTable([
                            ['Pregunta', 'Cantidad'],
                            ['SI',     SI],
                            ['NO',      NO],
                            ['Más o Menos',  MAS]
                        ]);

                            var options = {
                            title: 'Gráfica de "¿La información es correcta?"'
                            };

                            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                            chart.draw(data, options);                   
                    }
                });
            <?php
            }
            ?>

            
        }
    </script>
</body>
</html>