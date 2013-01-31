namespace RoutingSpeedSample
{
    partial class Map
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.mapEditorUserControl1 = new OsmSharp.Osm.UI.WinForms.MapEditorUserControl.MapEditorUserControl();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.txtLatitude = new System.Windows.Forms.TextBox();
            this.txtLongitude = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.txtNumCluster = new System.Windows.Forms.TextBox();
            this.txtList = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // mapEditorUserControl1
            // 
            this.mapEditorUserControl1.ActiveLayer = null;
            this.mapEditorUserControl1.Center = null;
            this.mapEditorUserControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mapEditorUserControl1.Location = new System.Drawing.Point(0, 0);
            this.mapEditorUserControl1.Map = null;
            this.mapEditorUserControl1.Name = "mapEditorUserControl1";
            this.mapEditorUserControl1.SelectionMode = false;
            this.mapEditorUserControl1.SelectionPixels = 10;
            this.mapEditorUserControl1.ShowLog = true;
            this.mapEditorUserControl1.ShowToolBar = false;
            this.mapEditorUserControl1.Size = new System.Drawing.Size(654, 459);
            this.mapEditorUserControl1.TabIndex = 0;
            this.mapEditorUserControl1.ZoomFactor = 0F;
            this.mapEditorUserControl1.MapClick += new OsmSharp.Osm.UI.WinForms.MapEditorUserControl.MapEditorUserControl.MapClickDelegate(this.mapEditorUserControl1_MapClick);
            this.mapEditorUserControl1.MapMove += new OsmSharp.Osm.UI.WinForms.MapEditorUserControl.MapEditorUserControl.MapMoveDelegate(this.mapEditorUserControl1_MapMove);
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 150;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // txtLatitude
            // 
            this.txtLatitude.Location = new System.Drawing.Point(537, 33);
            this.txtLatitude.Name = "txtLatitude";
            this.txtLatitude.Size = new System.Drawing.Size(100, 20);
            this.txtLatitude.TabIndex = 1;
            // 
            // txtLongitude
            // 
            this.txtLongitude.Location = new System.Drawing.Point(537, 70);
            this.txtLongitude.Name = "txtLongitude";
            this.txtLongitude.Size = new System.Drawing.Size(100, 20);
            this.txtLongitude.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(537, 97);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // txtNumCluster
            // 
            this.txtNumCluster.Location = new System.Drawing.Point(537, 139);
            this.txtNumCluster.Name = "txtNumCluster";
            this.txtNumCluster.Size = new System.Drawing.Size(100, 20);
            this.txtNumCluster.TabIndex = 4;
            // 
            // txtList
            // 
            this.txtList.Location = new System.Drawing.Point(537, 178);
            this.txtList.Name = "txtList";
            this.txtList.Size = new System.Drawing.Size(100, 20);
            this.txtList.TabIndex = 5;
            // 
            // Map
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(654, 459);
            this.Controls.Add(this.txtList);
            this.Controls.Add(this.txtNumCluster);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtLongitude);
            this.Controls.Add(this.txtLatitude);
            this.Controls.Add(this.mapEditorUserControl1);
            this.Name = "Map";
            this.Text = "Map";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private OsmSharp.Osm.UI.WinForms.MapEditorUserControl.MapEditorUserControl mapEditorUserControl1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.TextBox txtLatitude;
        private System.Windows.Forms.TextBox txtLongitude;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtNumCluster;
        private System.Windows.Forms.TextBox txtList;
    }
}

